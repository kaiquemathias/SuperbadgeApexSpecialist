@isTest

private class WarehouseCalloutServiceTest {   
    @isTest  
    static void runWarehouseEquipmentSyncTest(){
        Test.startTest();
        // implement mock callout test here
        Test.setMock(HTTPCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
        //System.enqueueJob(new WarehouseCalloutService());
        Test.stopTest();
        //System.assertEquals(1, [SELECT count() FROM Product2]);
    }     
}