using {kb.shop as shop} from '../../db/schema';

annotate shop.Booking with @title : '{i18n>bookingTitle}' {
    ID           @UI.Hidden;
    orderID      @title                     : '{i18n>orderID}';
    quantity     @title                     : '{i18n>quantity}';
    totalPrice   @title                     : '{i18n>totalPrice}'
                 @Measures.ISOCurrency      : CurrencyCode_code;
    CurrencyCode @title                     : '{i18n>currency}'
                 @Common.Text               : CurrencyCode.symbol
                 @Common.TextArrangement    : #TextLast;
    status       @title                     : '{i18n>status}'
                 @Common.Text               : status.name
                 @Common.TextArrangement    : #TextFirst;
    totalWeight  @title                     : '{i18n>totalWeight}';
}
