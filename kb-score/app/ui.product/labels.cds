using {kb.score as score} from '../../db/schema';

annotate score.Products with @title : '{i18n>productTitle}' {
    ID              @UI.Hidden;
    name            @title                  : '{i18n>productName}';
    category        @title                  : '{i18n>category}';
    weight          @title                  : '{i18n>weight}';
    quantity        @title                  : '{i18n>quantity}';
    supplier        @title                  : '{i18n>supplierName}'
                    @Common.Text            : supplier.name
                    @Common.TextArrangement : #TextOnly;
    price           @title                  : '{i18n>price}'
                    @Measures.ISOCurrency   : CurrencyCode_code;
    CurrencyCode    @title                  : '{i18n>Currency}'
                    @Common.Text            : CurrencyCode.symbol
                    @Common.TextArrangement : #TextLast;
    status          @title                  : '{i18n>status}'
                    @Common.Text            : status.name
                    @Common.TextArrangement : #TextFirst;
    image           @title                  : '{i18n>image}';
}