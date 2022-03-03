public with sharing class WarehouseCalloutServiceHelper {
    public static Boolean isValidEquipment(List<Product2> equipments) {
        return equipments.size( ) > 0;
    }

    public static string formatJson(String response){
        return response.replace('_id', 'id');
    }
}
