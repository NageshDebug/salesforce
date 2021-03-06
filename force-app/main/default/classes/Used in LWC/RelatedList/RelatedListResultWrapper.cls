/*************************************************************************************************
 * This file is part of the apex-limit-framework project, released under the MIT License.             *
 *************************************************************************************************/

global class RelatedListResultWrapper {
  @AuraEnabled
  global List<Object> AllRecords { get; set; }
  @AuraEnabled
  global List<Object> TopRecords { get; set; }
  @AuraEnabled
  global String DataTableHeaders { get; set; }
  @AuraEnabled
  global String ColumnButtonsJSON { get; set; }
  @AuraEnabled
  global String ColumnHeaderButtonsJSON { get; set; }
  @AuraEnabled
  global String ComponentTitle { get; set; }
  @AuraEnabled
  global String HeaderButtonsJSON { get; set; }
  @AuraEnabled
  global String CmpHeaderIcon { get; set; }

  global RelatedListResultWrapper(List<Object> AllRecords, List<Object> TopRecords, String DataTableHeaders, String ColumnButtonsJSON, String ColumnHeaderButtonsJSON, String ComponentTitle, String HeaderButtonsJSON, String CmpHeaderIcon) {
    this.AllRecords = AllRecords;
    this.TopRecords = TopRecords;
    this.DataTableHeaders = DataTableHeaders;
    this.ColumnButtonsJSON = ColumnButtonsJSON;
    this.ColumnHeaderButtonsJSON = ColumnHeaderButtonsJSON;
    this.ComponentTitle = ComponentTitle;
    this.HeaderButtonsJSON = HeaderButtonsJSON;
    this.CmpHeaderIcon = CmpHeaderIcon;
  }
}
