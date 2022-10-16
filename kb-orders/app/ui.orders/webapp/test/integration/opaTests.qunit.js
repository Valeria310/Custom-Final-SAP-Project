sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kb/ui/orders/test/integration/FirstJourney',
		'kb/ui/orders/test/integration/pages/ProductOrdersList',
		'kb/ui/orders/test/integration/pages/ProductOrdersObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductOrdersList, ProductOrdersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kb/ui/orders') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductOrdersList: ProductOrdersList,
					onTheProductOrdersObjectPage: ProductOrdersObjectPage
                }
            },
            opaJourney.run
        );
    }
);