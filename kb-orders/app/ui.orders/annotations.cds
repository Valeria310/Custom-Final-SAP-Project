using OrdersService as service from '../../srv/service';

annotate service.ProductOrders with @(
    UI        : {
        Identification      : [
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'OrdersService.approveOrder',
                Label  : '{i18n>approveOrder}'
            },
            {
                $Type  : 'UI.DataFieldForAction',
                Action : 'OrdersService.sendOrder',
                Label  : '{i18n>sendOrder}'
            }
        ],
        SelectionFields     : [status_ID],
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Value             : orderID,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : quantity,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : status_ID,
                Criticality       : status.criticality,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : productName,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : productImage,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : totalWeight,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : totalPrice,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : totalLocalPrice,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : CurrencyCode_code,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : LocalCurrencyCode_code,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {SortOrder : [{
            $Type      : 'Common.SortOrderType',
            Property   : orderID,
            Descending : false
        }]},
    },
    UI        : {
        HeaderInfo                     : {
            TypeName       : '{i18n>order}',
            TypeNamePlural : '{i18n>orders}',
            Title          : {Value : orderID},
            Description    : {Value : productName}
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            {
                $Type : 'UI.DataField',
                Value : productImage,
            },
            {
                $Type : 'UI.DataField',
                Value : productName,
                Label : '{i18n>productName}'
            },
            {
                $Type       : 'UI.DataField',
                Value       : status_ID,
                Criticality : status.criticality
            },
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type             : 'UI.DataField',
                Value             : orderID,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : quantity,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : status_ID,
                Criticality       : status.criticality,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : productName,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : productImage,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : totalWeight,
                ![@UI.Importance] : #High
            }
        ]},
        FieldGroup #PriceInfo            : {Data : [
            {
                $Type             : 'UI.DataField',
                Value             : totalPrice,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : totalLocalPrice,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : CurrencyCode_code,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Value             : LocalCurrencyCode_code,
                ![@UI.Importance] : #High
            }
        ]},
        FieldGroup #AdministrativeData : {Data : [
            {
                $Type : 'UI.DataField',
                Value : createdBy
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt
            }
        ]}
    },
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'PODetails',
            Label  : '{i18n>generalInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>generalInfo}',
                Target : '@UI.FieldGroup#Details'
            },{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>priceInfo}',
                Target : '@UI.FieldGroup#PriceInfo'
            }]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>adminInfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);
