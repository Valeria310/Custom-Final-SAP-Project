using ScoreService as service from '../../srv/service';

annotate service.Products with @(
    UI        : {
        SelectionFields     : [name],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : name,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]},
    }
);