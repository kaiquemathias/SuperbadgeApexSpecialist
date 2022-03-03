global with sharing class EquipmentResponseDTO {
    
    global String name {get;set;}
    global Integer cost {get;set;}
    global Integer quantity {get;set;}
    global Integer maintenanceperiod {get;set;}
    global Boolean replacement {get;set;}
    global Integer lifespan {get;set;}
    global String sku {get;set;}
    global String id {get;set;}
    
    public EquipmentResponseDTO() {
    }
}
