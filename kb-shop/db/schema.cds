namespace kb.shop;

using { managed } from '@sap/cds/common';
using { masterdata } from './master-data';
using { sap.common.CodeList, Currency } from './common';


entity Booking : managed {
    key ID: UUID;
        orderID: Integer;
        // productID: Association to Products;
        // supplierID: Association to Suppliers;
        quantity: Integer;
        totalPrice: Decimal(15,2);
        CurrencyCode: Currency;
        // productImage: LargeString @Core.IsURL @Core.MediaType: 'image/jpg';
        status: Association to one masterdata.OrderStatuses;
        totalWeight: Decimal;
}

entity Products: managed {
    key ID: UUID;
    name: String;
    category: String;
    weight: Double;
    price: Decimal(15,2);
    quantity: Integer;
    // supplier: Association to Suppliers;
    CurrencyCode: Currency; 
    status: Association to one masterdata.ProductStatuses;
    // image: LargeString @Core.IsURL @Core.MediaType: 'image/jpg';
}

entity Suppliers : managed {
    key ID: UUID;
    name: String;
    country: String;
    rating: Double;
    phonenumber: String;
    // product: Association to many Products on product.supplier = $self;
}