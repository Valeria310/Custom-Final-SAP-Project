const cds = require('@sap/cds');
const constants = require('./constants');
const cpi = require('./cpi');

module.exports = cds.service.impl(async function () {

    let { Products, Bookings } = this.entities;

    this.before('UPDATE', 'Products', async (req) => {
        const ID = req.data.ID;
        const quantity = req.data.quantity;
        const currentProduct = await SELECT.from(Products).where({ ID: ID });
        if (currentProduct[0].status_ID === 1) {
            req.data.quantity = quantity + currentProduct[0].quantity;
            await UPDATE(Bookings, { product_ID: ID }).with({ status_ID: 1 });
        };
        if (req.data.quantity === 0) {
            req.data.status_ID = constants.defaultValues.productStatusNotAvailable;
        } else if (req.data.quantity < 50) {
            req.data.status_ID = constants.defaultValues.productStatusSmallAmount;
        } else {
            req.data.status_ID = constants.defaultValues.productStatusAnouth;
        }
    })

    this.before('NEW', 'Products', async (req) => {
        req.data.image = constants.defaultValues.newProductIcon;
        req.data.status_ID = constants.defaultValues.productStatusNotAvailable;
    })

    this.before('CREATE', 'Products', async (req) => {
        const product = req.data;
        if (product.weight <= 0) return req.error(400, constants.genericErrors.wrongWeight);
        if (product.price <= 0) return req.error(400, constants.genericErrors.wrongPrice);
        if (product.quantity < 0) return req.error(400, constants.genericErrors.wrongQuantity);
    })

    this.on('orderProduct', 'Products', async (req) => {
        const product_ID = req.params[0].ID;
        const quantity = req.data.quantity;
        const { maxID } = await SELECT.one`max(orderID) as maxID`.from(Bookings);
        const { supplier_ID } = await SELECT.one`supplier_ID as supplier_ID`.from(Products).where({ ID: product_ID });
        const { CurrencyCode_code } = await SELECT.one`CurrencyCode_code as CurrencyCode_code`.from(Products).where({ ID: product_ID });
        const { price } = await SELECT.one`price as price`.from(Products).where({ ID: product_ID });
        const { weight } = await SELECT.one`weight as weight`.from(Products).where({ ID: product_ID });
        const { image } = await SELECT.one`image as image`.from(Products).where({ ID: product_ID });
        const totalPrice = price * quantity;
        const totalWeight = weight * quantity;
        if (quantity <= 0) {
            req.error(400, constants.genericErrors.quantityNotAplicable)
        } else {
            cpi.orderProduct(req);
            return INSERT({ orderID: maxID + 1, product_ID: product_ID, status_ID: 0, supplier_ID: supplier_ID, quantity: quantity, CurrencyCode_code: CurrencyCode_code, totalPrice: totalPrice, totalWeight: totalWeight, image: image }).into(Bookings);
        }
    })

    this.after('READ', 'Products', (each) => {
        if (each.status_ID != 0) {
            each.orderProductEnabled = true;
        }
    })
})