using { kb.score as score } from '../db/schema';
using { masterdata } from '../db/master-data';
using { sap.common as common} from '../db/common';

service ScoreService {

    entity Bookings as projection on score.Bookings;
    
    entity Products as projection on score.Products;
    
    entity Suppliers as projection on score.Suppliers;

    entity OrderStatuses as projection on masterdata.OrderStatuses;

    entity ProductStatuses as projection on masterdata.ProductStatuses;

    entity Currencies as projection on common.Currencies;

}