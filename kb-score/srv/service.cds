using { kb.score as score } from '../db/schema';

service ScoreService {

    entity Bookings as projection on score.Bookings;
    
    entity Products as projection on score.Products;

    entity Suppliers as projection on score.Suppliers;

}