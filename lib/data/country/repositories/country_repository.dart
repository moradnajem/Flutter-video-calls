import 'package:configuration/utility/logging.dart';
import 'package:flutter_video_calls/data/country/model/country_list.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';

const String PropertyName = 'alpha_2_code';

List<Country> countries = [];

class CountryRepository {

  /// Get data of Countries.
  ///
  /// Returns List of [Country].
  ///
  ///  * If [countries] is `null` or empty it returns a list of all [Countries.countryList].
  ///  * If [countries] is not empty it returns a filtered list containing
  ///    counties as specified.
  static List<Country> getCountriesData() {
    if (countries.isEmpty == true) {
      countries = Countries.countryList.map((country) => Country.fromJson(country)).toList();
    }
    Log.info("CountryRepository", countries.toString());
    return countries;
  }
}
