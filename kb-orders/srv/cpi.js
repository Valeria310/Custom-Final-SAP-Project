const cds = require('@sap/cds');

module.exports = {
    sendOrder: sendOrder
}

const { ProductOrders } = cds.entities('kb.orders')

async function sendOrder(req) {
    try {
        const ID = req.params[0];
        const orderInfo = await SELECT.from(ProductOrders).where({ ID: ID });
        const cpi = await cds.connect.to('CPIDestination');
        await cpi.tx(req).post('/http/score', {
            "productID": orderInfo[0].productID,
            "quantity": orderInfo[0].quantity
        });
        await UPDATE(ProductOrders, { ID: ID }).with({ status_ID: 3 });
    }
    catch (error) {
        console.log("Dispatch to CPI was not successful. Rejected with error: ", error)
    }
}

