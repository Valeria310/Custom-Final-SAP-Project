sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'kb.ui.supplier',
            componentId: 'ProductsObjectPage',
            entitySet: 'Products'
        },
        CustomPageDefinitions
    );
});