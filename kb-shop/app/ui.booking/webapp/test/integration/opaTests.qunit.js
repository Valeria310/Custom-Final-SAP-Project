sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kb/ui/booking/test/integration/FirstJourney',
		'kb/ui/booking/test/integration/pages/BookingList',
		'kb/ui/booking/test/integration/pages/BookingObjectPage'
    ],
    function(JourneyRunner, opaJourney, BookingList, BookingObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kb/ui/booking') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBookingList: BookingList,
					onTheBookingObjectPage: BookingObjectPage
                }
            },
            opaJourney.run
        );
    }
);