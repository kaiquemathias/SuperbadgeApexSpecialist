public with sharing class EquipmentBuilder {
    private String name;
    private Integer cost;
    private Integer quantity;
    private Integer maintenanceperiod;
    private Boolean replacement;
    private Integer lifespan;
    private String sku;
    private String id;

    public EquipmentBuilder() {
        this.name = null;
        this.cost = 0;
        this.quantity = 0;
        this.maintenanceperiod = 0;
        this.replacement = false;
        this.lifespan = 0;
        this.sku = null;
        this.id = null;
    }

    public EquipmentBuilder setName( String name ){
        this.name = name;
        return this;
    }

    public EquipmentBuilder setCost( Integer cost ){
        this.cost = cost;
        return this;
    }

    public EquipmentBuilder setQuantity( Integer quantity ){
        this.quantity = quantity;
        return this;
    }

    public EquipmentBuilder setMaintenanceCycle( Integer maintenanceperiod ){
        this.maintenanceperiod = maintenanceperiod;
        return this;
    }

    public EquipmentBuilder setReplacement( Boolean replacement ){
        this.replacement = replacement;
        return this;
    }

    public EquipmentBuilder setLifeSpan( Integer lifespan ){
        this.lifespan = lifespan;
        return this;
    }

    public EquipmentBuilder setSku( String sku ){
        this.sku = sku;
        return this;
    }

    public EquipmentBuilder setId( String id ){
        this.id = id;
        return this;
    }

    public Product2 build(){
        return new Product2(Name = this.name,
                            Cost__c = this.cost,
                            Current_Inventory__c = this.quantity,
                            Maintenance_Cycle__c = this.maintenanceperiod,
                            Replacement_Part__c = this.replacement,
                            Lifespan_Months__c = this.lifespan,
                            Warehouse_SKU__c = this.sku,
                            ProductCode = this.id);
    }

}
