/*************************************************************************************************
* This file is part of the apex-limit-framework project, released under the MIT License.             *
* See LICENSE file or go to https://github.com/Jaspreet1992/RelatedListReusableComponents for full license details. *
*************************************************************************************************/

public class FlattenJSONService implements IFlattenJSONService {
    
    private List<Object> objList;
    
    public virtual void setList(List<Object> objList){
        this.objList = objList;
    }
    
    public virtual List<Object> flattenListJSON(){
        for(integer i=0; i < objList.size(); i++){
            Map<String, Object> ObjAttributeMap = (Map<String, Object>) objList[i];
            Map<String, Object> ObjNewAttributeMap = new Map<String, Object>();
            
            for(String attrValueKey : ObjAttributeMap.keySet()){
                Object attrValue = ObjAttributeMap.get(attrValueKey);
                if(attrValue != 'attributes'){
                    if(isAttributeObject(attrValue)){
                        ObjNewAttributeMap = flattenObjectJSON(attrValue, attrValueKey);
                    }    
                }
            } 
            ObjAttributeMap.putAll(ObjNewAttributeMap);
            System.debug('--- updated map --- ' + ObjAttributeMap);
            ObjList[i] = ObjAttributeMap;
            System.debug('--- updated List --- ' + ObjList[i]);
        }
        
        return ObjList;
    }
    
    private Map<String, Object> flattenObjectJSON(Object obj, String objName){
        Map<String, Object> ObjAttributeMap;
        List<Object> ObjAttributeList;
        Map<String, Object> ObjNewAttributeMap = new Map<String, Object>();
        Map<String, Object> RelatedObjNewAttributeMap = new Map<String, Object>();
        
        if(isAttributeObject(obj)){
           ObjAttributeMap = (Map<String, Object>) obj;
        }
        else if(isAttributeList(obj)){
            ObjAttributeList = (List<Object>) obj;
            return flattenInnerListOfRecords(ObjAttributeList, ObjNewAttributeMap, objName);
        }
        
        if(ObjAttributeMap != null){
        	for(String attrValueKey : ObjAttributeMap.keySet()){
                Object attrValue = ObjAttributeMap.get(attrValueKey);

                if(attrValue != 'attributes'){
                    if(isAttributeObject(attrValue) || isAttributeList(attrValue)){
                        RelatedObjNewAttributeMap = flattenObjectJSON(attrValue, objName+ '.' +attrValueKey);	
                    }else{
                        ObjNewAttributeMap.put(objName+ '.' +attrValueKey, attrValue);
                    }    
                }
            }    
        }
        
        ObjNewAttributeMap.putAll(RelatedObjNewAttributeMap);
		System.debug('--- new Object JSON --- ' + ObjNewAttributeMap);
        
        return ObjNewAttributeMap;
	}
    
    private boolean isAttributeObject(Object attrValue){
        if(attrValue instanceof String || attrValue instanceof integer || attrValue instanceof decimal 
           || attrValue instanceof boolean || attrValue instanceof List<Object>){
            return false;
        }
        else{
            return true;
        }
    }
    
    private boolean isAttributeList(Object attrValue){
        if(attrValue instanceof List<Object>){
            return true;
        }
        else{
            return false;
        }
    }
    
    public virtual Map<String, Object> flattenInnerListOfRecords(List<Object> objList, Map<String, Object> parentMap, String parentName){
        System.debug('--- List Size --- ' + objList.size());
        parentMap.put(parentName+ '.size', objList.size());
        return parentMap;
    }

}