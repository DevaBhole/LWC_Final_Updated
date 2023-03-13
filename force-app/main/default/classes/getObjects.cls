public with sharing class getObjects {
  @AuraEnabled(cacheable=true)
  public static Map<String,String> getObject() {
    try {
      Map<String,String> objectMap = new Map<String,String>();
      for(Schema.SObjectType obj : Schema.getGlobalDescribe().values()){
        String name = obj.getDescribe().getLocalName();
        String label = obj.getDescribe().getLabel();
        objectMap.put(name, label);
      }
      return objectMap;
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
