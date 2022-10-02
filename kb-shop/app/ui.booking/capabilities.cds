using {ShopService} from '../../srv/service';

annotate ShopService.Booking with @odata.draft.enabled;

annotate ShopService.Booking with @Capabilities : {
    Deletable  : true,
    Insertable : true
};
