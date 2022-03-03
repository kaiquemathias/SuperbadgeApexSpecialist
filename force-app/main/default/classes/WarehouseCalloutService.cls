public with sharing class WarehouseCalloutService implements Queueable{

    @future ( callout=true )
    public static void runWarehouseEquipmentSync (){
        
        Object responseEquipments = EquipmentWebService.getEquipments();
        
        List<EquipmentResponseDTO> equipments = ( List<EquipmentResponseDTO> ) JSON.deserialize(  WareHouseCalloutServiceHelper.formatJson((string) responseEquipments), 
                                                                            List<EquipmentResponseDTO>.class );
        List<Product2> equipmentsNew = new List<Product2>();
        for ( EquipmentResponseDTO equipment : equipments ){
            Product2 product = new EquipmentBuilder()
                                .setName(equipment.name)
                                .setCost(equipment.cost)
                                .setQuantity(equipment.quantity)
                                .setMaintenanceCycle(equipment.maintenanceperiod)
                                .setReplacement(equipment.replacement)
                                .setLifeSpan(equipment.lifespan)
                                .setSku(equipment.sku)
                                .setId(equipment.Id) 
                                .build();
            equipmentsNew.add( product );
        }
        if ( WarehouseCalloutServiceHelper.isValidEquipment(equipmentsNew) ){
            EquipmentRepository.upsertRecords(equipmentsNew);
        }
        
    }

    public static void execute (QueueableContext context){
        runWarehouseEquipmentSync();
    }
}