/*************************************************************************************************
* This file is part of the apex-limit-framework project, released under the MIT License.             *
* See LICENSE file or go to https://github.com/Jaspreet1992/RelatedListReusableComponents for full license details. *
*************************************************************************************************/ 

public interface IQueryBuilderService {
    
	String getQuery(String recordId, String queryWithoutConditions, String whereCondition, String sortField, 
                    String relationshipFieldApiName, String sortDirection, String postCondition, String dynamicConditions);
}