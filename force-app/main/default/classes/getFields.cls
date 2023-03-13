public with sharing class getFields {
    @AuraEnabled(cacheable=true)
    public static Map<String,String> getFields(String selectedObjName){
    try {
        Map<String,String> fieldMap = new Map<String,String>();
        Map<String,Schema.sObjectType> globalDescribe = Schema.getGlobalDescribe();
      
        for(Schema.SObjectField fieldName : globalDescribe.get(selectedObjName).getDescribe().fields.getMap().values()){
            fieldMap.put(fieldName.getDescribe().getName(),fieldName.getDescribe().getName());
         }       
           return fieldMap;     
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    }
