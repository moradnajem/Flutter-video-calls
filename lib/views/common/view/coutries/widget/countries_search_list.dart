import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/data/country/repositories/country_repository.dart';
import 'package:flutter_video_calls/views/common/view/coutries/widget/flag.dart';
import 'package:get/get.dart';

/// Creates a list of Countries with a search textfield.
class CountrySearchList extends StatefulWidget {
  @override
  _CountrySearchListState createState() => _CountrySearchListState();
}

class _CountrySearchListState extends State<CountrySearchList> {

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
                country.dialCode.contains(value.toLowerCase()),
          )
          .toList();
    }

    return countries;
  }

  /// Returns the country name of a [Country]. if the locale is set and translation in available.
  /// returns the translated name.
  String? getCountryName(Country country) {
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
            decoration: InputDecoration(hintText: S.current.find_dial_code),
          ),
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredCountries.length,
            itemBuilder: (BuildContext context, int index) {
              Country country = filteredCountries[index];
              return ListTile(
                leading: Flag(country),
                title: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('${getCountryName(country)}',
                        textAlign: TextAlign.start)),
                subtitle: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text('${country.dialCode}',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.start)),
                onTap: () => Get.back(result: country),
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