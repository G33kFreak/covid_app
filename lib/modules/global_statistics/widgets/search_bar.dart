import 'package:covid_app/configs/colors.dart';
import 'package:covid_app/repositories/countries/models/country.dart';
import 'package:covid_app/routes/routes.dart';
import 'package:covid_app/services/countries/bloc/countries_service_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesServiceBloc, CountriesServiceState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: searchBar,
            borderRadius: const BorderRadius.all(
              Radius.circular(35),
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Colors.black.withOpacity(.15),
                Colors.black.withOpacity(.001)
              ],
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(.05),
              ),
            ],
          ),
          child: TypeAheadField<Country>(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: const InputDecoration(
                filled: false,
                hintText: 'Search...',
                contentPadding: EdgeInsets.fromLTRB(24, 24, 12, 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
              ),
            ),
            suggestionsCallback: (pattern) async {
              context
                  .read<CountriesServiceBloc>()
                  .add(CountrySearched(pattern));
              return state.matchedCountries ?? [];
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                tileColor: searchBar,
                title: Text(suggestion.country),
              );
            },
            onSuggestionSelected: (suggestion) {
              Navigator.of(context).pushNamed(
                Routes.locationStatistics,
                arguments: {
                  'country': suggestion.slug,
                },
              );
            },
          ),
        );
      },
    );
  }
}
