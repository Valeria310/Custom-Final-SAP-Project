using ScoreService as service from '../../srv/service';

annotate service.Bookings with @(
    UI : {
        SelectionFields : [supplier_ID, status_ID],
        LineItem : [
            {
                $Type : 'UI.DataField',
                Value : orderID,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : status_ID,
                Criticality : status.criticality,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : product.image,
                Label : '{i18n>image}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : product.name,
                Label : '{i18n>productName}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.name,
                Label : '{i18n>supplierName}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.phonenumber,
                Label : '{i18n>phonenumber}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : totalWeight,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : supplier_ID,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {SortOrder : [{
            $Type : 'Common.SortOrderType',
            Property : orderID,
            Descending : false
        }]},
    },
    UI : {
        HeaderInfo : {
            TypeName : '{i18n>booking}',
            TypeNamePlural : '{i18n>bookings}',
            Title : {Value : orderID},
            Description : {Value : product.name, Label: '{i18n>productName}'}
        },
        HeaderFacets : [{
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description : {Data : [
            {
                $Type : 'UI.DataField',
                Value : product.image,
                Label : '{i18n>image}'
            },
            {
                $Type : 'UI.DataField',
                Value : product.name,
                Label : '{i18n>productName}'
            },
            {
                $Type : 'UI.DataField',
                Value : status_ID,
                Criticality: status.criticality
            },
        ]},
        FieldGroup #Details : {Data : [
           {
                $Type : 'UI.DataField',
                Value : orderID,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : status_ID,
                Criticality : status.criticality,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : product.image,
                Label : '{i18n>image}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : product.name,
                Label : '{i18n>productName}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.name,
                Label : '{i18n>supplierName}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.phonenumber,
                Label : '{i18n>phonenumber}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
                ![@UI.Importance] : #High
            },       
            {
                $Type : 'UI.DataField',
                Value : product.price,
                Label : '{i18n>price}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : product.weight,
                Label : '{i18n>weight}',
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : totalPrice,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : totalWeight,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : supplier_ID,
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
            Label : '{i18n>generalInfo}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label : '{i18n>generalInfo}',
                Target : '@UI.FieldGroup#Details'
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