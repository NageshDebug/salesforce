/*************************************************************************************************
* This file is part of the apex-limit-framework project, released under the MIT License.             *
*************************************************************************************************/ 

public class QueryBuilderService implements IQueryBuilderService {
    
    public QueryBuilder qBuilder;
    private String query;
    //private List<WhereClause> whereClausesList;
    
    private QueryBuilderService(){
        qBuilder = new QueryBuilder();
        //whereClausesList = new List<WhereClause>();
    }
    
    public static QueryBuilderService getInstance(){
        return new QueryBuilderService();
    }
    
    public String getQuery(String recordId, String queryWithoutConditions, String whereCondition, String sortField, 
                           String relationshipFieldApiName, String sortDirection, String postCondition, String dynamicWhereClauses){
        return buildQuery(recordId, queryWithoutConditions, whereCondition, sortField, 
                          relationshipFieldApiName, sortDirection, postCondition, dynamicWhereClauses);
    }
    
    /*private String buildWhereClause(){
        return WhereClauseBuilder.initialize().setWhereClauses(whereClausesList).build();
    }*/
    
    private String buildQuery(String recordId, String queryWithoutConditions, String whereCondition, String sortField, 
                              String relationshipFieldApiName, String sortDirection, String postCondition, String dynamicWhereClauses){
        
        //String dynamicWhereClauses;
        
        /*if(whereClausesList.size() > 0){
            dynamicWhereClauses = buildWhereClause(); 
            whereCondition += ' AND ' + dynamicWhereClauses;
        }*/
                                  
        
        /*if(dynamicWhereClauses != null && !String.isEmpty(dynamicWhereClauses)){
            if(whereCondition != null && !String.isEmpty(dynamicWhereClauses)){
                whereCondition = ' where ' + metaDataCondition + recordIdCondition;
            }
            whereCondition += 
            whereCondition += ' AND ' + dynamicWhereClauses;
        }*/
        
        query = qBuilder.setQueryWithoutFilters(queryWithoutConditions)
            .setWhereCondition(whereCondition)
            .setSortField(sortField)
            .setRecordId(recordId)
            .setDynamicWhereClauses(dynamicWhereClauses)
            .setRelationshipFieldApiName(relationshipFieldApiName)
            .setSortDirection(sortDirection)
            .setPostCondition(postCondition)
            .build();
        
        return query;
    }
    
    /*public void setWhereClause(String fieldName, WhereOperator operator, String clauseValue){
		whereClausesList.add(new WhereClause(fieldName, operator, clauseValue));       
    }
    
    public void setWhereClause(String fieldName, WhereOperator operator, String clauseValue, boolean isOrCondition){
		whereClausesList.add(new WhereClause(fieldName, operator, clauseValue, isOrCondition));       
    }
    
    public void setWhereClause(String fieldName, WhereOperator operator, String clauseValue, boolean isOrCondition, boolean hasStartBracket){
		whereClausesList.add(new WhereClause(fieldName, operator, clauseValue, isOrCondition, hasStartBracket));       
    }
    
    public void setWhereClause(String fieldName, WhereOperator operator, String clauseValue, boolean isOrCondition, boolean hasStartBracket, boolean hasEndBracket){
		whereClausesList.add(new WhereClause(fieldName, operator, clauseValue, isOrCondition, hasStartBracket, hasEndBracket));       
    }*/

}