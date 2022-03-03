public with sharing class MaintenanceRequestHelper {
    public static void updateWorkOrders(Map<Id,Case> cases) {
        if(isValidCase(cases))
            throw new MaintenanceRequestHelperException('Cases not specified.');
        
        List<Case> casesInserted = createMaintenanceRequestForRoutineMaintenance (cases);
        createEquipmentMaintenanceItem (cases,casesInserted);
    }

    private static List<Case> createMaintenanceRequestForRoutineMaintenance(Map<Id,Case> cases){
        List<Case> casesInserted = CaseRepository.insertRecords( MaintenanceRequestBuilder.build(cases) );
        return casesInserted;
    }

    private static void createEquipmentMaintenanceItem(Map<Id,Case> cases, List<Case> casesInserted) {
        EquipmentMaintenanceItemRespository.insertRecords (EquipmentMaintenanceItemBuilder.build(cases,casesInserted));    
    }
    

    private static Boolean isValidCase(Map<Id,Case> cases){
        return cases != null && cases.size() > 0;
    }

    public class MaintenanceRequestHelperException extends Exception {}
}