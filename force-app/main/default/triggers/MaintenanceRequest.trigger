trigger MaintenanceRequest on Case (after update) {
    Map<Id,Case> casesToInsert = new Map<Id,Case>();
    for(Case maintenance : Trigger.new){
        if( maintenance.Status == 'Closed' ){
            if(maintenance.Type == 'Repair' || maintenance.Type == 'Routine Maintenance' ){
                casesToInsert.put(maintenance.Id,maintenance);
            }
        }
    }
    if(casesToInsert != null && casesToInsert.size() > 0)
        MaintenanceRequestHelper.updateWorkOrders(casesToInsert);
}