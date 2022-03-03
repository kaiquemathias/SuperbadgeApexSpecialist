public with sharing class EquipmentWebService {
    
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    private static Object runHttp (){
        Http http = new Http ( );
        HttpRequest request = new HttpRequest ( );
        request.setEndpoint( WAREHOUSE_URL );
        request.setMethod( 'GET' );
        HttpResponse res = http.send( request );
        return res.getBody();
    }

    public static Object getEquipments(){
        return runHttp();
    }
    
}
