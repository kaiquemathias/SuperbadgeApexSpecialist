public with sharing class EquipmentMaintenanceItemSelector {
    public static AggregateResult[] getByMaintenanceRequestId(Set<Id> caseIds) {
        return [SELECT Maintenance_Request__r.Id Id,MIN(Equipment__r.Maintenance_Cycle__c)cycle
                FROM Equipment_Maintenance_Item__c
                WHERE Maintenance_Request__r.Id IN: caseIds
                GROUP BY Maintenance_Request__r.Id];
    }

    public static List<Equipment_Maintenance_Item__c> findByMaintenanceRequestId(Set<Id> caseIds){
        return [SELECT Maintenance_Request__c, Equipment__c, Quantity__c 
        FROM Equipment_Maintenance_Item__c 
        WHERE Maintenance_Request__c IN: caseIds];
    }
}
