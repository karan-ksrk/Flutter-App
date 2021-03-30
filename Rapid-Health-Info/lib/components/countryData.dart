import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const url =
    "https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php";
const header = {
  'x-rapidapi-host': "coronavirus-monitor.p.rapidapi.com",
  'x-rapidapi-key': "29f2b2a22amsh6ba79087545ef2ap1d382bjsn2439fb5c6dea"
};

class CountryData {
  CountryData({@required this.index});
  int index;
  String country_name;
  String cases;
  String deaths;
  String total_recovered;
  String new_deaths;
  String new_cases;
  String serious_critical;
  String active_cases;
  String cases_per_1m_pop;

  Future<dynamic> updateData() async {
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data)['countries_stat'];
      country_name = decodeData[index]['country_name'];
      cases = decodeData[index]['cases'];
      deaths = decodeData[index]['deaths'];
      total_recovered = decodeData[index]['total_recovered'];
      new_deaths = decodeData[index]['new_deaths'];
      new_cases = decodeData[index]['new_cases'];
      serious_critical = decodeData[index]['serious_critical'];
      active_cases = decodeData[index]['active_cases'];
      cases_per_1m_pop = decodeData[index]['total_cases_per_1m_population'];
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}

void main() {
  CountryData countryData = CountryData(index: 2);
  var data = countryData.updateData();
}
