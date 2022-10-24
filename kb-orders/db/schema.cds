namespace kb.orders;

using {managed} from '@sap/cds/common';

using {
    sap.common.CodeList,
    Currency
} from './common';

entity ProductOrders : managed {
    key ID                          : UUID;
        quantity                    : Integer;
        orderID                     : Integer;
        productID                   : UUID;
        productName                 : String;
        productImage                : LargeString @Core.IsURL  @Core.MediaType : 'image/jpg';
        totalWeight                 : Integer;
        totalPrice                  : Decimal(15, 2);
        totalLocalPrice             : Decimal(15, 2);
        CurrencyCode                : Currency;
        LocalCurrencyCode           : Currency;
        status                      : Association to one Statuses;
        virtual approveOrderEnabled : Boolean;
        virtual sendOrderEnabled    : Boolean;
        virtual deleteOrderEnabled  : Boolean;
}

entity Statuses {
    key ID          : Integer;
        name        : String;
        criticality : Integer;
}
