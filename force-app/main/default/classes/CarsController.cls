public class CarsController {
    //Ejecución en consola
    //List<CarsController.wrapperCar> wrpList = CarsController.getCars();
	//System.debug(wrpList);

    @AuraEnabled(cacheable=true)
    public static List<wrapperCar> getCars(){
        List<wrapperCar> wrpList = new List<wrapperCar>();
        List<Product2> lstProduct = [SELECT Id, Name, ProductCode, IsActive, Type__c, Is_Car__c 
                                     FROM Product2 
                                     WHERE Is_Car__c = true];
        for(Product2 prod: lstProduct){
            wrapperCar wrpCar = new wrapperCar();
            wrpCar.name = prod.Name;
            wrpCar.productCode = prod.ProductCode;
            wrpCar.isActive = prod.IsActive;
            wrpCar.typeCar = prod.Type__c;
            wrpList.add(wrpCar);
        }
        return wrpList;
    }
    
    public class wrapperCar{
        @AuraEnabled public String name {get;set;}
        @AuraEnabled public String productCode {get;set;}
        @AuraEnabled public Boolean isActive {get;set;}
        @AuraEnabled public String typeCar {get;set;}
    }
    
}