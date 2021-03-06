/*************************************************************************************************
* This file is part of the apex-limit-framework project, released under the MIT License.             *
* See LICENSE file or go to https://github.com/Jaspreet1992/RelatedListReusableComponents for full license details. *
*************************************************************************************************/ 

public abstract class MetaDataDao implements IDao{
	
    public abstract void queryMetaData(String key);
    public abstract List<Object> getData();
    
}