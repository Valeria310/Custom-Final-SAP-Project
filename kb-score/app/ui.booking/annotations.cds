using ScoreService as service from '../../srv/service';

annotate service.Bookings with @(
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