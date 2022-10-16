using ScoreService from '../../srv/service';

annotate ScoreService.Products with {
    name                @mandatory;
    category            @mandatory;
    weight              @mandatory;
    price               @mandatory;
    quantity            @mandatory;
    CurrencyCode_code   @mandatory;
    status              @readonly;
    image               @readonly;
};