sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kb/ui/product/test/integration/FirstJourney',
		'kb/ui/product/test/integration/pages/ProductsList',
		'kb/ui/product/test/integration/pages/ProductsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductsList, ProductsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kb/ui/product') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductsList: ProductsList,
					onTheProductsObjectPage: ProductsObjectPage
                }
            },
            opaJourney.run
        );
    }
);