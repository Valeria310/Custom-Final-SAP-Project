using ShopService as service from '../../srv/service';

annotate service.Booking with @(
    UI        : {
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
                Value             : totalPrice,
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
                Value             : totalWeight,
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
            TypeName       : 'Reader',
            TypeNamePlural : 'Readers',
            // Title          : {Value : firstName}, название продукта
            Description    : { Value : status_ID, Criticality: status.criticality},
        },
        HeaderFacets                   : [{
            $Type             : 'UI.ReferenceFacet',
            Target            : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description        : {Data : [
            // {
            //     $Type : 'UI.DataField',
            //     Value : image
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : readerBithday название
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : phonenumber  поставщик
            // },
            {
                $Type : 'UI.DataField',
                Value : status_ID,
                Criticality: status.criticality
            }
        ]},
        FieldGroup #Details            : {Data : [
            {
                $Type : 'UI.DataField',
                Value : orderID
            },
            {
                $Type : 'UI.DataField',
                Value : quantity
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice
            },
            {
                $Type : 'UI.DataField',
                Value : totalWeight
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
            Label  : '{i18n>readerInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>readerinfo}',
                Target : '@UI.FieldGroup#Details'
            }]
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'POAdmininfo',
            Label  : '{i18n>adminInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>admininfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);
