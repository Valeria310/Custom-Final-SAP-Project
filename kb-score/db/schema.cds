namespace kb.score;

using { managed } from '@sap/cds/common';
using { masterdata } from './master-data';
using { sap.common.CodeList, Currency } from './common';


entity Bookings : managed {
    key ID: UUID;
    name: String;
    category: String;
    weight: Double;
    price: Decimal(15,2);
    quantity: Integer;
}

entity Products : managed {
    key ID: UUID;
    name: String;
    category: String;
    weight: Double;
    price: Decimal(15,2);
    quantity: Integer;
    supplier: Association to Suppliers;
    CurrencyCode: Currency;
    status: Association to one masterdata.ProductStatuses;
    image: String;
    // image: LargeString @Core.IsURL @Core.MediaType: 'image/jpg';
}

entity Suppliers : managed {
    key ID: UUID;
    name: String;
    country: String;
    rating: Double;
    phonenumber: String;
    product: Association to many Products on product.supplier = $self;
}