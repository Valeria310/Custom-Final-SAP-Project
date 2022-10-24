using {OrdersService} from '../../srv/service';

annotate OrdersService.ProductOrders with @(
    Capabilities                    : {
        Deletable  : false,
        Insertable : false,
        Updatable  : false
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'orderID',
        AllowedExpressions : 'SingleValue'
    }]}
);