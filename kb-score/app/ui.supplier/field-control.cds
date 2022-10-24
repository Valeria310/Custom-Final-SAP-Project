using ScoreService from '../../srv/service';

annotate ScoreService.Suppliers with {
    name        @mandatory;
    country     @mandatory;
    rating      @mandatory;
    phoneNumber @mandatory;
};
