sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kb/ui/supplier/test/integration/FirstJourney',
		'kb/ui/supplier/test/integration/pages/SuppliersList',
		'kb/ui/supplier/test/integration/pages/SuppliersObjectPage',
		'kb/ui/supplier/test/integration/pages/ProductsObjectPage'
    ],
    function(JourneyRunner, opaJourney, SuppliersList, SuppliersObjectPage, ProductsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kb/ui/supplier') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSuppliersList: SuppliersList,
					onTheSuppliersObjectPage: SuppliersObjectPage,
					onTheProductsObjectPage: ProductsObjectPage
                }
            },
            opaJourney.run
        );
    }
);