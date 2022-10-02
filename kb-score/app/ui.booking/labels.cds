using {kb.score as score} from '../../db/schema';

annotate score.Bookings with @title : '{i18n>booking}' {
    ID              @UI.Hidden;
    orderID         @title                  : '{i18n>orderID}';
    quantity        @title                  : '{i18n>quantity}';
    totalWeight     @title                  : '{i18n>totalWeight}';
    supplier        @title                  : '{i18n>supplierName}'
                    @Common.Text            : supplier.name
                    @Common.TextArrangement : #TextOnly;
    totalPrice      @title                  : '{i18n>totalPrice}'
                    @Measures.ISOCurrency   : CurrencyCode_code;
    CurrencyCode    @title                  : '{i18n>Currency}'
                    @Common.Text            : CurrencyCode.symbol
                    @Common.TextArrangement : #TextLast;
    status          @title                  : '{i18n>status}'
                    @Common.Text            : status.name
                    @Common.TextArrangement : #TextFirst;
}