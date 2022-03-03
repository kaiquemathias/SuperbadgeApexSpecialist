public class EquipmentMaintenanceItemBuilder {
    public static List<Equipment_Maintenance_Item__c> build(Map<Id,Case> cases, List<Case> casesToInsert){
        Map<Id,Equipment_Maintenance_Item__c> equipmentMaintenanceItems = 
                                                new Map<Id,Equipment_Maintenance_Item__c>(EquipmentMaintenanceItemSelector.findByMaintenanceRequestId(cases.keySet()));
        Map<Id,Equipment_Maintenance_Item__c> filteredEquipmentMaintenanceItems = new Map<Id,Equipment_Maintenance_Item__c>();
        List<Equipment_Maintenance_Item__c> clonedEquipmentMaintenanceItem = new List<Equipment_Maintenance_Item__c>();
        
        for(Case c : casesToInsert){
            filteredEquipmentMaintenanceItems = filterEquipmentMaintenanceItemsByCaseId(c.ParentId,equipmentMaintenanceItems.values());
            for(Equipment_Maintenance_Item__c emi : filteredEquipmentMaintenanceItems.values()){
                Equipment_Maintenance_Item__c emiclone = emi.clone();
                emiclone.Maintenance_Request__c = c.Id;
                clonedEquipmentMaintenanceItem.add(emiclone);
            }
        }

        return clonedEquipmentMaintenanceItem;
    }
    
    private static Map<Id,Equipment_Maintenance_Item__c> filterEquipmentMaintenanceItemsByCaseId(Id caseId, 
                                                                                                List<Equipment_Maintenance_Item__c> equipmentMaintenanceItems){
        Map<Id,Equipment_Maintenance_Item__c> filteredEquipmentMaintenanceItems = new Map<Id,Equipment_Maintenance_Item__c>();
        for(Equipment_Maintenance_Item__c emi: equipmentMaintenanceItems){
            if(emi.Maintenance_Request__c == caseId ) filteredEquipmentMaintenanceItems.put(emi.Id,emi);
        }
        return filteredEquipmentMaintenanceItems;
    }
}
