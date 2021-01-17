import { LightningElement, track, api, wire } from 'lwc';

import listAllFields from '@salesforce/apex/FieldSetHelper.listAllFields';
import getData from '@salesforce/apex/FieldSetHelper.getData';

export default class CustomMetadataDataTable extends LightningElement {
    @api developerName;
    @api typeString;

    @track columnList;
    @track objectName;
    @track columnsName;
    @track rowCount;
    @track incrementCount;
    @track enableViewMore;

    @track dataList;
    @track processedDataList;

    @wire(listAllFields, { tableName: '$developerName', typeString: '$typeString' })
    wiredFields({ error, data }) {
        if (data) {
            console.log(data);

            this.columnList = data.fieldDetails;
            this.objectName = data.objectType;
            this.columnsName = data.columnName;
            this.rowCount = data.rowCount;
            this.incrementCount = data.rowCount;
            this.enableViewMore = data.viewMoreOption;

            getData({ ObjectName: this.objectName, ColumnNames: this.columnsName })
                .then(data => { this.dataList = data, this.processedDataList = data.slice(0, this.rowCount) })
                .catch(err => console.log(err));
        }

        if (error) {
            console.log(error);
        }
    }

    loadMoreData(e) {
        e.preventDefault();
        var allData = this.dataList;
        var rowCount = this.rowCount;
        var increment = this.incrementCount;

        if (rowCount <= allData.length) {
            rowCount = rowCount + increment;
        }
        if (rowCount >= allData.length) {
            const element = this.template.querySelector('[data-id="viewMore"]');
            element.addClass("slds-hide");
        }

        this.rowCount = rowCount;
        this.processedDataList = allData.slice(0, this.rowCount);
    }
}