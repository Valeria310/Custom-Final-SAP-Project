namespace kb.score;

using { managed } from '@sap/cds/common';

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
}

entity Suppliers : managed {
    key ID: UUID;
    name: String;
    category: String;
    weight: Double;
    price: Decimal(15,2);
    quantity: Integer;
}