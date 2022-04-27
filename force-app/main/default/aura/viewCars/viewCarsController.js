({
	init : function(component, event, helper) {
        let columns = [{label: 'Name', fieldName: 'name', type: 'text'},
                      {label: 'Product code', fieldName: 'productCode', type: 'text'},
                      {label: 'Is active?', fieldName: 'isActive', type: 'boolean'},
                      {label: 'Type', fieldName: 'typeCar', type: 'text'}];
        
        component.set('v.columns', columns);
        
        var action = component.get("c.getCars");
        //action.setParams({ firstName : cmp.get("v.firstName") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                let result = response.getReturnValue();
                console.log(result);
                component.set('v.lstCars', result);
            } else {
                
            }
        });
        $A.enqueueAction(action);
	}
})