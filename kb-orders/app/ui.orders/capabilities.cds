using {OrdersService} from '../../srv/service';

annotate OrdersService.ProductOrders with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true,
        Updatable  : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'orderID',
        AllowedExpressions : 'SingleValue'
    }]}
);