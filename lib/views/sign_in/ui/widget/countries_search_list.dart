import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/data/country/repositories/country_repository.dart';
import 'package:flutter_video_calls/views/sign_in/controllers/sign_in_x.dart';
import 'package:get/get.dart';

/// Creates a list of Countries with a search textfield.
class CountrySearchList extends StatefulWidget {

  @override
  _CountrySearchListState createState() => _CountrySearchListState();
}

class _CountrySearchListState extends State<CountrySearchList> {
  final SignInController _controller = Get.find();

  TextEditingController _searchController = TextEditingController();
  late List<Country> filteredCountries;

  @override
  void initState() {
    filteredCountries = filterCountries();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Filters the list of Country by text from the search box.
  List<Country> filterCountries() {
    final value = _searchController.text.trim();

    if (value.isNotEmpty) {
      return countries
          .where(
            (Country country) =>
                country.alpha3Code!
                    .toLowerCase()
                    .startsWith(value.toLowerCase()) ||
                country.name!.toLowerCase().contains(value.toLowerCase()) ||
                getCountryName(country)!
                    .toLowerCase()
                    .contains(value.toLowerCase()) ||
                country.dialCode!.contains(value.toLowerCase()),
          )
          .toList();
    }

    return countries;
  }

  /// Returns the country name of a [Country]. if the locale is set and translation in available.
  /// returns the translated name.
  String? getCountryName(Country country) {
    if (_controller.country.value?.alpha2Code != null && country.nameTranslations != null) {
      String? translated = country.nameTranslations![_controller.country.value?.alpha2Code!];
      if (translated != null && translated.isNotEmpty) {
        return translated;
      }
    }
    return country.name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: _searchController,
            autofocus: false,
            onChanged: (value) =>
                setState(() => filteredCountries = filterCountries()),
            decoration: InputDecoration(
              hintText: S.current.findDialCode
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredCountries.length,
            itemBuilder: (BuildContext context, int index) {
              Country country = filteredCountries[index];
              return ListTile(
                leading: _Flag(country),
                title: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('${getCountryName(country)}',
                        textAlign: TextAlign.start)),
                subtitle: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('${country.dialCode ?? ''}',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start)),
                onTap: () => Navigator.of(context).pop(country),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

class _Flag extends StatelessWidget {
  final Country country;

  _Flag(this.country);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(country.flagUri ?? "", width: 32.0),
        SizedBox(width: 6.0),
        Text(
          '${country.dialCode}',
          textDirection: TextDirection.ltr,
        ),
      ],
    );
  }
}
