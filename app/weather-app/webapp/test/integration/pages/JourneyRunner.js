sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"weatherapp/test/integration/pages/VoivodeshipsList",
	"weatherapp/test/integration/pages/VoivodeshipsObjectPage"
], function (JourneyRunner, VoivodeshipsList, VoivodeshipsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('weatherapp') + '/test/flpSandbox.html#weatherapp-tile',
        pages: {
			onTheVoivodeshipsList: VoivodeshipsList,
			onTheVoivodeshipsObjectPage: VoivodeshipsObjectPage
        },
        async: true
    });

    return runner;
});

