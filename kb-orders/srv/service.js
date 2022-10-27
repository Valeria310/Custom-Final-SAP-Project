const cds = require('@sap/cds');
const cpi = require('./cpi');
const wf = require('./wf');

module.exports = cds.service.impl(async function () {
    let { ProductOrders } = this.entities;

    this.before('CREATE', 'ProductOrders', async (req) => {
        const { maxID } = await SELECT.one`max(orderID) as maxID`.from(ProductOrders);
        req.data.orderID = maxID + 1;
    });

    this.after('READ', 'ProductOrders', (each) => {
        if (each.status_ID == 1 || each.status_ID == 4) {
            each.approveOrderEnabled = true;
        }
        if (each.status_ID == 2) {
            each.sendOrderEnabled = true;
        }
        if (each.status_ID == 3) {
            each.deleteOrderEnabled = true;
        }
    })

    this.on('approveOrder', 'ProductOrders', wf.approveOrder);
    this.on('sendOrder', 'ProductOrders', cpi.sendOrder);

    this.on('deleteOrder', 'ProductOrders', async (req) => {
        const orderID = req.params[0];
        await DELETE.from(ProductOrders).where({ ID: orderID });
    })

})