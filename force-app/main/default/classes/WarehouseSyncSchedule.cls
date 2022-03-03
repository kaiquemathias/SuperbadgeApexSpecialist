global with sharing class WarehouseSyncSchedule implements Schedulable{
    global void execute(SchedulableContext sch){
        System.enqueueJob(new WarehouseCalloutService());
    }
}