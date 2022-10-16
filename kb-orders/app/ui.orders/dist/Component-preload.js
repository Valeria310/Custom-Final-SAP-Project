//@ui5-bundle kb/ui/orders/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"kb/ui/orders/Component.js":function(){sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("kb.ui.orders.Component",{metadata:{manifest:"json"}})});
},
	"kb/ui/orders/i18n/i18n.properties":'# This is the resource bundle for kb.ui.orders\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Orders\n\n#YDES: Application description\nappDescription=Orders\n\nflpTitle=Orders\n\nflpSubtitle=\n',
	"kb/ui/orders/manifest.json":'{"_version":"1.42.0","sap.app":{"id":"kb.ui.orders","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:lrop","version":"1.7.5","toolsId":"55a7e3ba-3553-4720-94f7-9a4f6c40d148"},"dataSources":{"mainService":{"uri":"orders/","type":"OData","settings":{"annotations":["annotation"],"localUri":"localService/metadata.xml","odataVersion":"4.0"}},"annotation":{"type":"ODataAnnotation","uri":"annotations/annotation.xml","settings":{"localUri":"annotations/annotation.xml"}}},"crossNavigation":{"inbounds":{"kb-ui-orders-inbound":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"Orders","action":"manage","title":"{{flpTitle}}","subTitle":"{{flpSubtitle}}","icon":""}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.102.1","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"kb.ui.orders.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"ProductOrdersList","target":"ProductOrdersList"},{"pattern":"ProductOrders({key}):?query:","name":"ProductOrdersObjectPage","target":"ProductOrdersObjectPage"}],"targets":{"ProductOrdersList":{"type":"Component","id":"ProductOrdersList","name":"sap.fe.templates.ListReport","options":{"settings":{"entitySet":"ProductOrders","variantManagement":"Page","navigation":{"ProductOrders":{"detail":{"route":"ProductOrdersObjectPage"}}}}}},"ProductOrdersObjectPage":{"type":"Component","id":"ProductOrdersObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"ProductOrders"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"kbordersservice"}}'
}});
