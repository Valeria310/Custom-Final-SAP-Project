const cds = require('@sap/cds');
const constants = require('./constants');

module.exports = {
    orderProduct: orderProduct
}

const { Products } = cds.entities('kb.score')

async function orderProduct(req) {
    try {
        const { ID } = req.params[0];
        const quantity = req.data.quantity;
        const orderInfo = await SELECT.from(Products).where({ ID: ID });
        if (quantity > 0) {
            const payload = JSON.stringify({
                "productID": ID,
                "quantity": quantity,
                "productName": orderInfo[0].name,
                "quantity": quantity,
                "totalPrice": orderInfo[0].price*quantity,
                "CurrencyCode_code": orderInfo[0].CurrencyCode_code,
                "totalWeight": orderInfo[0].weight*quantity,
                "status_ID": constants.defaultValues.newOrderStatus,
                "image": orderInfo[0].image
            });
            const cpi = await cds.connect.to('CPIDestination');
            await cpi.tx(req).post('/http/order', payload);
            await UPDATE(Products, { ID: ID }).with({ status_ID: 1 });
        } else return req.error(400, constants.genericErrors.quantityNotApplicable);
    }
    catch (error) {
        console.log("Dispatch to CPI was not successful. Rejected with error: ", error)
    }
}

