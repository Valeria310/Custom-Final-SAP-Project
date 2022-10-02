using kb.shop as shop from '../db/schema';
using { masterdata } from '../db/master-data';
using sap.common as common from '../db/common';


service ShopService {

    entity Booking as projection on shop.Booking;

    entity Products as projection on shop.Products;

    entity Suppliers as projection on shop.Suppliers;

    entity OrderStatuses as projection on masterdata.OrderStatuses;

    entity ProductStatuses as projection on masterdata.ProductStatuses;

    entity Currencies as projection on common.Currencies;

}
