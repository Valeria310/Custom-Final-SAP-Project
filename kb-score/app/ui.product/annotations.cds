using ScoreService as service from '../../srv/service';

annotate service.Products with @(
    UI : {
        SelectionFields : [category, supplier_ID, status_ID],
        LineItem : [
            {
                $Type : 'UI.DataField',
                Value : status_ID,
                Criticality : status.criticality,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : image,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : category,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : weight,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : price,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : quantity,
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
            Property : name,
            Descending : false
        }]},
    },
    UI : {
        HeaderInfo : {
            TypeName : '{i18n>product}',
            TypeNamePlural : '{i18n>products}',
            Title : {Value : name},
            Description : {Value : supplier_ID}
        },
        HeaderFacets : [{
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description : {Data : [
            {
                $Type : 'UI.DataField',
                Value : image
            },
            {
                $Type : 'UI.DataField',
                Value : name
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
                Value : status_ID,
                Criticality : status.criticality
            },
            {
                $Type : 'UI.DataField',
                Value : image
            },
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : category
            },
            {
                $Type : 'UI.DataField',
                Value : weight
            },
            {
                $Type : 'UI.DataField',
                Value : price
            },
            {
                $Type : 'UI.DataField',
                Value : quantity
            },
            {
                $Type : 'UI.DataField',
                Value : supplier_ID
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
                Label  : '{i18n>admininfo}',
                Target : '@UI.FieldGroup#AdministrativeData'
            }]
        }
    ]
);