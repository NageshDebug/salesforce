import { LightningElement, wire, track, api } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getRelatedRecords from '@salesforce/apex/ReusableRelatedListCmpCtrl.getRelatedRecords';

export default class CustomRelatedList extends LightningElement(LightningElement) {
    @api metaDatakey;
    @api recordId;
    @api relationshipFieldApiName;
    @api dynamicCondition;

    @track data = [];
    @track columns = [];
    @track ViewRecordLabel = 'Show More';
    @track showFooter = false;
    @track sortBy = '';
    @track sortedDirection = '';

    AllRecords;
    TopRecords;
    ColumnButtons;
    ColumnHeaderButtons;
    ComponentTitle;
    HeaderButtons;
    CmpHeaderIcon;


    @wire(getRelatedRecords, {
        recordId: '$recordId', metaDatakey: '$metaDatakey',
        relationshipFieldApiName: '$relationshipFieldApiName', dynamicCondition: '$dynamicCondition',
        sortField: '$sortBy', sortDirection: '$sortedDirection'
    })
    loadResults({ error, data }) {
        if (error) {
            //to do
            console.log('from Error block ' + error);

            if (Array.isArray(error.body)) {
                this.error = error.body.map(e => e.message).join(', ');
            } else if (typeof error.body.message === 'string') {
                this.error = error.body.message;
            }
            console.log('error ' + this.error);
        }
        else if (data) {
            //to do
            this.TopRecords = data.TopRecords;
            this.AllRecords = data.AllRecords;
            console.log('TopRecords: ' + JSON.stringify(data.TopRecords));
            console.log('AllRecords: ' + JSON.stringify(data.AllRecords));
            console.log('AllRecords length: ' + JSON.stringify(data.AllRecords.length));

            this.columns = JSON.parse(data.DataTableHeaders);
            if (data.TopRecords && data.TopRecords.length > 0) {
                console.log('Data block');
                this.data = this.TopRecords;
            }
            else {
                console.log('Data else block');
                this.formateNoDataRow();
                console.log('Data top Recs: ' + this.data);
            }

            if (data.AllRecords && (data.AllRecords.length > 5)) {
                console.log('show Footer: ' + this.showFooter);
                this.showFooter = true;
            }

            if (data.ColumnButtonsJSON !== '' && data.ColumnButtonsJSON !== null && data.ColumnButtonsJSON !== undefined) {
                this.ColumnButtons = JSON.parse(data.ColumnButtonsJSON);
            }

            if (data.ColumnHeaderButtonsJSON !== '' && data.ColumnHeaderButtonsJSON !== null && data.ColumnHeaderButtonsJSON !== undefined) {
                this.ColumnHeaderButtons = JSON.parse(data.ColumnHeaderButtonsJSON);
            }

            if (data.HeaderButtonsJSON !== '' && data.HeaderButtonsJSON !== null && data.HeaderButtonsJSON !== undefined) {
                this.HeaderButtons = JSON.parse(data.HeaderButtonsJSON);
            }

            if (data.ComponentTitle !== '' && data.ComponentTitle !== null && data.ComponentTitle !== undefined) {
                this.ComponentTitle = data.ComponentTitle;
            }
            if (data.CmpHeaderIcon) {
                this.CmpHeaderIcon = data.CmpHeaderIcon;
            }
        }
    }

    formateNoDataRow() {
        let noDateSet = false;
        for (let i = 0; i < this.columns.length; i++) {
            if (this.columns[i].type === 'text' && noDateSet === false) {
                this.data = JSON.parse(`[{"` + this.columns[i].fieldName + `":"No Data"}]`);
                noDateSet = true;
            }
            if (this.columns[i].type === 'action') {
                this.columns.splice(i, 1);
            }
        }
    }

    showAllRecords() {
        if (this.ViewRecordLabel === 'Show More') {
            this.data = this.AllRecords;
            this.ViewRecordLabel = 'Show Less';
        }
        else {
            this.data = this.TopRecords;
            this.ViewRecordLabel = 'Show More';
        }
    }

    updateColumnSorting(event) {
        // field name
        this.sortBy = event.detail.fieldName;

        // sort direction
        if (this.sortedDirection === 'asc') {
            this.sortedDirection = 'desc';
        } else {
            this.sortedDirection = 'asc';
        }

        // calling sortdata function to sort the data based on direction and selected field
        this.sortData(event.detail.fieldName, event.detail.sortDirection);
        return refreshApex(this.data);


    }

    sortData(fieldname, direction) {
        // serialize the data before calling sort function
        let parseData = JSON.parse(JSON.stringify(this.data));

        // Return the value stored in the field
        let keyValue = (a) => {
            return a[fieldname];
        };

        // cheking reverse direction 
        let isReverse = direction === 'asc' ? 1 : -1;

        // sorting data 
        parseData.sort((x, y) => {
            x = keyValue(x) ? keyValue(x) : ''; // handling null values
            y = keyValue(y) ? keyValue(y) : '';

            // sorting values based on direction
            return isReverse * ((x > y) - (y > x));

        });

        // set the sorted data to data table data
        this.data = parseData;

    }

    handleHeaderButtonAction(event) {
        console.log(' button clicked ' + event.target.value);

        /*for(let index=0; index<this.HeaderButtons; index++){

        }*/
    }

    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;

        if (this.ColumnButtons !== '' && this.ColumnButtons !== null && this.ColumnButtons !== undefined) {
            for (let index = 0; index < this.ColumnButtons.length; index++) {
                let col_button = this.ColumnButtons[index];
                let label = col_button.label;
                let link = col_button.link;
                let openAs = col_button.openAs;

                if (label === actionName && link !== '' && link !== null && link !== undefined) {
                    if (link.indexOf("standard view nooverride") !== -1) {
                        link = '/' + row.Id + '?nooverride=1';
                    }
                    else if (link.indexOf("standard view") !== -1) {
                        link = '/' + row.Id;
                    }
                    else if (link.indexOf("standard edit nooverride") !== -1) {
                        link = '/' + row.Id + '/e?nooverride=1';
                    }
                    else if (link.indexOf("standard edit") !== -1) {
                        link = '/' + row.Id + '/e';
                    }
                    else if (link.indexOf("?") !== -1) {
                        link = link + '&ParentId=' + this.recordId + '&RecId=' + row.Id;
                    }
                    else if (openAs !== 'modal-dialog') {
                        link = link + '?ParentId=' + this.recordId + '&RecId=' + row.Id;
                    }
                    console.log(' button clicked ' + link);

                    if (openAs !== '' && openAs !== null && openAs !== undefined) {
                        if (openAs == 'modal-dialog') {
                            dispatchOpenDialogEvent(link);
                        }
                        if (openAs === 'window') {
                            window.open(link, "childWindow", "height=570,width=820,scrollbars=yes");
                        }
                        else if (openAs === 'tab') {
                            window.open(link, "_blank");
                        }
                        else {
                            window.location = link;
                        }
                    }
                }
            }
        }

    }

    dispatchOpenDialogEvent(dialogName) {
        const openModalDialogEvent = new CustomEvent('Name', { detail: dialogName });
        this.dispatchEvent(openModalDialogEvent);
    }

}