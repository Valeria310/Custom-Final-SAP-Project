namespace masterdata;

entity ProductStatuses {
    key ID: Integer;
    name: String;
    criticality: Integer
}

entity OrderStatuses {
    key ID: Integer;
    name: String;
    criticality: Integer
}