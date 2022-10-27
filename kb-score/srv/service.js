const cds = require('@sap/cds');
const constants = require('./constants');
const cpi = require('./cpi');

module.exports = cds.service.impl(async function () {
    let currentProduct;

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

    this.before('READ', 'Products', async (req) => {
        if (req.path.includes('/product')) {
            currentProduct = req.data.ID
        }
    })

    this.before('UPDATE', 'Suppliers', async (req) => {
        try {
            req.data.product.forEach(product => {
                if (product.weight <= 0) return req.error(400, constants.genericErrors.wrongWeight);
                if (product.price <= 0) return req.error(400, constants.genericErrors.wrongPrice);
                if (product.quantity < 0) return req.error(400, constants.genericErrors.wrongQuantity);
                if (product.quantity === 0) {
                    product.status_ID = constants.defaultValues.productStatusNotAvailable;
                } else if (product.quantity < 50) {
                    product.status_ID = constants.defaultValues.productStatusSmallAmount;
                } else {
                    product.status_ID = constants.defaultValues.productStatusAnouth;
                }
            })
        } catch (error) {
            console.error(error)
        }
    })

    this.on('orderProduct', 'Products', async (req) => {
        const product_ID = req.path.includes('/product')?currentProduct:req.params[0].ID;
        const quantity = req.data.quantity;
        const { maxID } = await SELECT.one`max(orderID) as maxID`.from(Bookings);
        const product = await SELECT.from(Products).where({ ID: product_ID });
        const supplier_ID = product[0].supplier_ID;
        const CurrencyCode_code = product[0].CurrencyCode_code;
        const price = product[0].price;
        const weight = product[0].weight;
        const image = product[0].image;
        const totalPrice = price * quantity;
        const totalWeight = weight * quantity;
        if (quantity <= 0) {
            req.error(400, constants.genericErrors.quantityNotAplicable)
        } else {
            cpi.orderProduct(req, product_ID);
            return INSERT({ orderID: maxID + 1, product_ID: product_ID, status_ID: 0, supplier_ID: supplier_ID, quantity: quantity, CurrencyCode_code: CurrencyCode_code, totalPrice: totalPrice, totalWeight: totalWeight, image: image }).into(Bookings);
        }
    })

    this.after('READ', 'Products', (each) => {
        if (each.status_ID != 0) {
            each.orderProductEnabled = true;
        }
    })
})