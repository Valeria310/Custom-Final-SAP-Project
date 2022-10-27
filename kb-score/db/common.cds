namespace common;

using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

extend sap.common.Currencies with {
    numcode  : Integer;
    exponent : Integer;
    minor    : String;
};

type CurrencyType : Decimal(15, 2) @(
    Semantic.amount.currencyCode : 'Currency code',
    sap.unit                     : 'Currency code'
);
