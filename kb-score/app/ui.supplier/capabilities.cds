using {ScoreService} from '../../srv/service';

annotate ScoreService.Suppliers with @odata.draft.enabled;

annotate ScoreService.Suppliers with @(
    Capabilities                    : {
        Deletable  : true,
        Insertable : true
    },
    Capabilities.FilterRestrictions : {FilterExpressionRestrictions : [{
        Property           : 'name',
        AllowedExpressions : 'SingleValue'
    }]}
);