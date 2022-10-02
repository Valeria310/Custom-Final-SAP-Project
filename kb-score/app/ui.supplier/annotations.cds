using ScoreService as service from '../../srv/service';

annotate service.Suppliers with @(
    UI : {
        SelectionFields : [name, rating],
        LineItem : [
            {
                $Type : 'UI.DataField',
                Value : name,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : country,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : rating,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : phonenumber,
                ![@UI.Importance] : #High
            }
        ],
        PresentationVariant : {SortOrder : [{
            $Type : 'Common.SortOrderType',
            Property : rating,
            Descending : false
        }]},
    },
    UI : {
        HeaderInfo : {
            TypeName : '{i18n>supplier}',
            TypeNamePlural : '{i18n>suppliers}',
            Title : {Value : name},
            Description : {Value : rating}
        },
        HeaderFacets : [{
            $Type : 'UI.ReferenceFacet',
            Target : '@UI.FieldGroup#Description',
            ![@UI.Importance] : #High
        }],
        FieldGroup #Description : {Data : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : country
            },
            {
                $Type : 'UI.DataField',
                Value : rating
            },
        ]},
        FieldGroup #Details : {Data : [
           {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : country
            },
            {
                $Type : 'UI.DataField',
                Value : rating
            },
            {
                $Type : 'UI.DataField',
                Value : phonenumber
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