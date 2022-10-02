sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'kb/ui/booking/test/integration/FirstJourney',
		'kb/ui/booking/test/integration/pages/BookingsList',
		'kb/ui/booking/test/integration/pages/BookingsObjectPage'
    ],
    function(JourneyRunner, opaJourney, BookingsList, BookingsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('kb/ui/booking') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBookingsList: BookingsList,
					onTheBookingsObjectPage: BookingsObjectPage
                }
            },
            opaJourney.run
        );
    }
);