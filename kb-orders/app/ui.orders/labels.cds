using {kb.orders as orders} from '../../db/schema';

annotate orders.ProductOrders with @title : '{i18n>booking}' {
    ID                      @UI.Hidden;
    orderID                 @title                  : '{i18n>orderID}';
    quantity                @title                  : '{i18n>quantity}';
    productName             @title                  : '{i18n>productName}';
    productImage            @title                  : '{i18n>image}';
    totalWeight             @title                  : '{i18n>totalWeight}';
    totalPrice              @title                  : '{i18n>totalPrice}';
    totalLocalPrice         @title                  : '{i18n>totalLocalPrice}';
    CurrencyCode            @title                  : '{i18n>Currency}'
                            @Common.Text            : CurrencyCode.symbol
                            @Common.TextArrangement : #TextLast;
    LocalCurrencyCode       @title                  : '{i18n>LocalCurrency}'
                            @Common.Text            : LocalCurrencyCode.symbol
                            @Common.TextArrangement : #TextLast;
    status                  @title                  : '{i18n>status}'
                            @Common.Text            : status.name
                            @Common.TextArrangement : #TextFirst;
}