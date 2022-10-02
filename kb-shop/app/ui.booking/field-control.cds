using ShopService from '../../srv/service';

annotate ShopService.Booking with {
    orderID       	@readonly;
    quantity     	@mandatory;
    totalPrice     	@readonly;
    CurrencyCode    @mandatory;
    status        	@readonly;
    totalWeight     @readonly;
};
