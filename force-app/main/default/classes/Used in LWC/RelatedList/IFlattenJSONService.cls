/*************************************************************************************************
* This file is part of the apex-limit-framework project, released under the MIT License.             *
* See LICENSE file or go to https://github.com/Jaspreet1992/RelatedListReusableComponents for full license details. *
*************************************************************************************************/

public interface IFlattenJSONService {
	List<Object> flattenListJSON();
    Map<String, Object> flattenInnerListOfRecords(List<Object> objList, Map<String, Object> parentMap, String parentName);
    void setList(List<Object> objList);
}