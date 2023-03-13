public with sharing class getRecords {
    @AuraEnabled(cacheable=true)
    public static List<SObject> recordsFetch(string objname,List<String> fields){
        try {
            List<sObject> records = new List<sObject>();
            System.debug(objName);
            System.debug('field names');
            for(String fieldGet : fields){
                System.debug(fieldGet);
            }
            System.debug(fields);
             //List<String> fieldNames = (List<String>) JSON.deserialize(field, List<String>.class);
    
            if (fields != null && !fields.isEmpty()) {
                String soql = 'SELECT ';
                for (String field : fields) {
                    soql += field + ',';
                }
                soql = soql.removeEnd(',');
                soql += ' FROM ' + objName;
                records = Database.query(soql);
            }
            System.debug('records');
            for(sObject record :records){
                System.debug(record);
            }
            return records;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteRecord(String objId){
        try {
             Database.delete(objId);
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }
}