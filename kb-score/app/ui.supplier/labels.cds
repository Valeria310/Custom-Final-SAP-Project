using {kb.score as score} from '../../db/schema';

annotate score.Suppliers with @title : '{i18n>supplier}' {
    ID              @UI.Hidden;
    name            @title                  : '{i18n>supplierName}';
    country         @title                  : '{i18n>country}';
    rating          @title                  : '{i18n>rating}';
    phonenumber     @title                  : '{i18n>phonenumber}';
}