public class MaintenanceRequestBuilder {
    public static List<Case> build(Map<Id,Case> cases){
        List<Case> casesNew = new List<Case>();
        Map<String,Date> result = getDueDate(cases.keySet());
        for(Case caseParent : cases.values()){
            
            Case caseNew = new Case();
            
            caseNew.ParentId = caseParent.Id;
            caseNew.Subject = caseParent.Subject;
            caseNew.Date_Due__c = result.get(caseParent.Id);
            caseNew.Vehicle__c = caseParent.Vehicle__c;
            caseNew.Product__c = caseParent.Product__c;
            caseNew.ContactId  = caseParent.ContactId;
            caseNew.AccountId  = caseParent.AccountId;
            caseNew.AssetId    = caseParent.AssetId;
            caseNew.Type       = 'Routine Maintenance';
            caseNew.Status     = 'New';
            caseNew.Date_Reported__c = Date.today();
            casesNew.add(caseNew);
        }
        return casesNew;
    }
    private static Map<String,Date> getDueDate(Set<Id> caseIds){
        Integer minDays = 0;
        Map<String,Date> caseDueDates = new Map<String,Date>();
        AggregateResult[] groupedEquipmentMaintenanceItem = EquipmentMaintenanceItemSelector.getByMaintenanceRequestId(caseIds);
        for(AggregateResult ar : groupedEquipmentMaintenanceItem ){
            minDays = ar.get('cycle') != null ? Integer.valueOf(ar.get('cycle')) : 0;
            caseDueDates.put((string)ar.get('Id'),Date.Today().addDays(minDays));
        }
        
        return caseDueDates;
    }
}
