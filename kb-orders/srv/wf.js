const cds = require('@sap/cds');
const constants = require('./constants');

module.exports = {
    approveOrder: approveOrder
}

const { ProductOrders } = cds.entities('kb.orders')

async function approveOrder(req) {
    try {
        const ID = req.params[0];
        let query = cds.read(ProductOrders).where({ ID: ID })
        let instance = await cds.run(query);
        let status_ID = instance[0].status_ID;
        let quantity = instance[0].quantity;
        if (status_ID == 1 || status_ID == 4) {
            const workflow = await cds.connect.to('workflowService')
            await workflow.tx(req).post('/rest/v1/workflow-instances', {
                "definitionId": "approveproductorder",
                "context": {
                    "WorkflowDetails": {
                        "title": "Product(s) in order",
                        "comment": "Please Approve"
                    },
                    "ProductOrder": {
                        "productID": instance[0].productID,
                        "quantity": quantity,
                        "productName": instance[0].productName,
                        "totalWeight": instance[0].totalWeight,
                        "totalPrice": +instance[0].totalPrice,
                        "totalLocalPrice": +instance[0].totalLocalPrice,
                        "status_ID": 1,
                        "CurrencyCode_code": instance[0].CurrencyCode_code,
                        "LocalCurrencyCode_code": instance[0].LocalCurrencyCode_code,
                        "ID": instance[0].ID
                    }
                }
            }
            )
            return UPDATE(ProductOrders, ID).with({ status_ID: 5 })
        }
        else if(status_ID == 5) {
            req.error(400, constants.processingOrder)
        }
    }
    catch (error) {
        console.log("Error of the WF instance creation: ", error)
    }
}


