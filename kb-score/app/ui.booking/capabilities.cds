using {ScoreService} from '../../srv/service';

annotate ScoreService.Bookings with @(
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