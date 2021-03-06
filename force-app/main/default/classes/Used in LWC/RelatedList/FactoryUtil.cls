/*************************************************************************************************
* This file is part of the apex-limit-framework project, released under the MIT License.             *
* See LICENSE file or go to https://github.com/Jaspreet1992/RelatedListReusableComponents for full license details. *
*************************************************************************************************/
public class FactoryUtil {
    
    private static FactoryUtil factory;
    
    private FactoryUtil(){}
    
    public static FactoryUtil getInstance(){
        if(factory == null){
            return new FactoryUtil();
        }
        else{
            return factory;
        }
    }
    
    public MetaDataDao getMetaDataDao(){
        return new RRListMetaDataDao();
    }
    
    public SObjectDao getSObjectDao(){
        return new SObjectDao();
    }
    
	public IFlattenJSONService getFlattenService(List<Object> objList, String serviceClassName){
        IFlattenJSONService service;
        Type classType;
        
        try{
            if(serviceClassName == 'default'){
                classType = Type.forName('FlattenJSONService');
            }
            else{
                classType = Type.forName(serviceClassName);
            }
            
            service = (IFlattenJSONService) classType.newInstance();
            service.setList(objList);
            return service;
        }
        catch(Exception ex){
            System.debug('---- Exception ---- ' + ex.getMessage());
        }
        service = new FlattenJSONService();
        service.setList(objList);
        return service;
    }
}