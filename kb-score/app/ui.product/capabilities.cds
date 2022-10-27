using {ScoreService} from '../../srv/service';

annotate ScoreService.Products with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : false,
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'name',
        AllowedExpressions : 'SingleValue'
    }]}
);