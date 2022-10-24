using { kb.orders as order } from '../db/schema';
using { sap.common as common } from '../db/common';

service OrdersService {
    entity ProductOrders as projection on order.ProductOrders actions {
        @Core.OperationAvailable : in.approveOrderEnabled
        action approveOrder();
        @Core.OperationAvailable : in.sendOrderEnabled
        action sendOrder();
        @Core.OperationAvailable : in.deleteOrderEnabled
        action deleteOrder();
    };
    entity Statuses as projection on order.Statuses;
}

service TechnicalService @(requires: 'system-user') {
    entity ProductOrders as projection on order.ProductOrders;
    entity Statuses as projection on order.Statuses;
    entity Currencies as projection on common.Currencies;
}