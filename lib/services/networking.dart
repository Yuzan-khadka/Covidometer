import 'dart:convert';
import 'package:covidometer/services/country_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Networking {
  Future getData(BuildContext context) async {
    String countryName = Provider.of<CountryName>(context).defaultName;
    final String apiUrl =
        "https://covid-193.p.rapidapi.com/statistics?country=$countryName";
    try {
      http.Response response = await http.get(apiUrl, headers: {
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "f8d43a05bfmshc8fa465570f3bf5p134a0ejsn662a920963c5",
      });
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  Future getFlag(BuildContext context) async {
    String countryName = Provider.of<CountryName>(context).defaultName;
    final String apiUrl =
        "https://restcountries.eu/rest/v2/name/${countryName == 'All' || countryName == 'Nepal' ? countryName = 'usa' : countryName}?fullText=true";
    try {
      http.Response response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
        //print(decodedData);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
