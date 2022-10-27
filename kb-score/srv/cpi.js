const cds = require('@sap/cds');
const constants = require('./constants');

module.exports = {
    orderProduct: orderProduct
}

const { Products } = cds.entities('kb.score')

async function orderProduct(req, ID) {
    try {
        const quantity = req.data.quantity;
        const productInfo = await SELECT.from(Products).where({ ID: ID });
        if (quantity > 0) {
            const payload = JSON.stringify({
                "productID": ID,
                "quantity": quantity,
                "productName": productInfo[0].name,
                "quantity": quantity,
                "totalPrice": productInfo[0].price*quantity,
                "CurrencyCode_code": productInfo[0].CurrencyCode_code,
                "totalWeight": productInfo[0].weight*quantity,
                "status_ID": constants.defaultValues.newOrderStatus,
                "image": productInfo[0].image
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

