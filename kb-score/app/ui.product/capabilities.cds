using {ScoreService} from '../../srv/service';

annotate ScoreService.Products with @odata.draft.enabled;

annotate ScoreService.Products with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'name',
        AllowedExpressions : 'SingleValue'
    }]}
);