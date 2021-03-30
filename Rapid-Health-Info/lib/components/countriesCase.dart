import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rapidhealthinfo/components/countryData.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CountriesCase extends StatefulWidget {
  @override
  _CountriesCaseState createState() => _CountriesCaseState();
}

class _CountriesCaseState extends State<CountriesCase> {
  var _datas = List();

  Future<List> getData() async {
    http.Response response = await http.get(url, headers: header);
    var datas = List();
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data)['countries_stat'];
      datas.clear();
      for (var data in decodeData) {
        datas.add(data);
      }
      return datas;
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getData().then((value) {
      setState(() {
        _datas.addAll(value);
      });
    });
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: RefreshIndicator(
          displacement: 10.0,
          onRefresh: () async {
            await Future.delayed(
              Duration(seconds: 1),
            );
          },
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              String triple_data =
                  _datas[index]['cases'].replaceAll(RegExp(r'[^\d]+'), '');
              double case_indicator_value =
                  (int.parse(triple_data) / 100000) * 200;
              triple_data =
                  _datas[index]['deaths'].replaceAll(RegExp(r'[^\d]+'), '');
              double death_indicator_value =
                  (int.parse(triple_data) / 25000) * 200;
              triple_data = _datas[index]['total_recovered']
                  .replaceAll(RegExp(r'[^\d]+'), '');
              double recovered_indicator_value =
                  (int.parse(triple_data) / 100000) * 200;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 70.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF030C2D),
                      ),
                      child: Center(
                        child: Text(
                          _datas[index]['country_name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LinearPercentIndicator(
                          width: case_indicator_value,
                          lineHeight: 4.0,
                          backgroundColor: Colors.blue,
                          trailing: Text(_datas[index]['cases']),
                        ),
                        LinearPercentIndicator(
                          width: death_indicator_value,
                          lineHeight: 4.0,
                          backgroundColor: Colors.red,
                          trailing: Text(_datas[index]['deaths']),
                        ),
                        LinearPercentIndicator(
                          width: recovered_indicator_value,
                          lineHeight: 4.0,
                          backgroundColor: Colors.green,
                          trailing: Text(_datas[index]['total_recovered']),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
