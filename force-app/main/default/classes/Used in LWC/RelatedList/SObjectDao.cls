/*************************************************************************************************
* This file is part of the apex-limit-framework project, released under the MIT License.             *
*************************************************************************************************/ 

public virtual class SObjectDao implements IDao{
	
    private List<SObject> records;
    
    public virtual void queryRecords(String query){
        records = Database.query(query);
    }
    
    public virtual List<Object> getData(){
        return (List<Object>) records;
    }
    
}