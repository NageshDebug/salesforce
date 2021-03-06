/*************************************************************************************************
 * This file is part of the apex-limit-framework project, released under the MIT License.             *
 *************************************************************************************************/

public class QueryBuilder {
  public String queryWithoutFilters;
  public String fields;
  public String sObjectApiName;
  public String sortField;
  public String sortDirection;
  public String whereCondition;
  public String postCondition;
  public String relationshipFieldApiName;
  public String dynamicWhereClauses;
  public String recordId;

  public QueryBuilder setQueryWithoutFilters(String queryWithoutFilters) {
    this.queryWithoutFilters = queryWithoutFilters;
    return this;
  }

  public QueryBuilder setFields(String fields) {
    this.fields = fields;
    return this;
  }

  public QueryBuilder setSObjectApiName(String sObjectApiName) {
    this.sObjectApiName = sObjectApiName;
    System.debug('$$ sObjectApiName: ' + sObjectApiName);
    return this;
  }

  public QueryBuilder setSortField(String sortField) {
    this.sortField = sortField;
    System.debug('$$ sortField: ' + sortField);
    return this;
  }

  public QueryBuilder setRelationshipFieldApiName(String relationshipFieldApiName) {
    this.relationshipFieldApiName = relationshipFieldApiName;
    System.debug('$$ relationshipFieldApiName: ' + relationshipFieldApiName);
    return this;
  }

  public QueryBuilder setRecordId(String recordId) {
    this.recordId = recordId;
    System.debug('$$ recordId: ' + recordId);
    return this;
  }

  public QueryBuilder setDynamicWhereClauses(String dynamicWhereClauses) {
    this.dynamicWhereClauses = dynamicWhereClauses;
    System.debug('$$ dynamicWhereClauses: ' + dynamicWhereClauses);
    return this;
  }

  public QueryBuilder setSortDirection(String sortDirection) {
    this.sortDirection = sortDirection;
    System.debug('$$ sortDirection: ' + sortDirection);
    return this;
  }

  public QueryBuilder setWhereCondition(String condition) {
    /*if(condition.contains('clause')){
            
        }*/
    this.whereCondition = condition;
    System.debug('$$ whereCondition: ' + whereCondition);
    return this;
  }

  public QueryBuilder setPostCondition(String postCondition) {
    this.postCondition = postCondition;
    return this;
  }

  public String build() {
    String query;

    String metaDataCondition = whereCondition != null && !String.isEmpty(whereCondition) ? whereCondition : '';
    String recordIdCondition = ' AND ' + relationshipFieldApiName != null && !String.isEmpty(relationshipFieldApiName) && recordId != null && !String.isEmpty(recordId) ? relationshipFieldApiName + '=' + '\'' + recordId + '\'' : '';

    String dynamicCondition = ' AND ' + dynamicWhereClauses != null && !String.isEmpty(dynamicWhereClauses) ? dynamicWhereClauses : '';
    String finalCondition = ' where ' + metaDataCondition + recordIdCondition + dynamicCondition;
    System.debug('$$ finalCondition: ' + finalCondition);
    String sortBy = sortField != null && !String.isEmpty(sortField) && sortDirection != null && !String.isEmpty(sortDirection) ? ' order by ' + sortField + ' ' + sortDirection : '';
    System.debug('$$ sortBy: ' + sortBy);
    String postCondition = postCondition != null && !String.isEmpty(postCondition) ? ' ' + postCondition : '';
    System.debug('$$ queryWithoutFilters: ' + queryWithoutFilters);
    if (queryWithoutFilters != null && !String.isEmpty(queryWithoutFilters)) {
      query = queryWithoutFilters + finalCondition + sortBy + postCondition;
      System.debug('$$ query: ' + query);
    } else {
    }
    return query;
  }
}
