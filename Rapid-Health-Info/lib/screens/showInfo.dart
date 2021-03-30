import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rapidhealthinfo/components/countriesCase.dart';
import 'package:rapidhealthinfo/components/roundContainerWorld.dart';
import 'package:rapidhealthinfo/components/worldData.dart';

class ShowInfo extends StatefulWidget {
  static String id = 'shownfo';
  @override
  _ShowInfoState createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      updateData();
    });
    print('init called');
  }

  updateData() {
    WorldData().updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030C2D),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "WORLD",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Horizon',
                            letterSpacing: 3.0,
                          ),
                        ),
                        Text(
                          WorldData.stats_time == null
                              ? '0'
                              : WorldData.stats_time,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RoundContainer(
                            title: "Total Cases",
                            data: WorldData.total_cases == null
                                ? '0'
                                : WorldData.total_cases),
                        RoundContainer(
                            title: "Total Deaths",
                            data: WorldData.total_deaths == null
                                ? '0'
                                : WorldData.total_deaths),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RoundContainer(
                            title: "New Deaths",
                            data: WorldData.new_deaths == null
                                ? '0'
                                : WorldData.new_deaths),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RoundContainer(
                            title: "Total Recovered",
                            data: WorldData.total_recovered == null
                                ? '0'
                                : WorldData.total_recovered),
                        RoundContainer(
                            title: "New Cases",
                            data: WorldData.new_cases == null
                                ? '0'
                                : WorldData.new_cases),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      print('Precautions');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    splashColor: Color(0xFF030C2D),

                    child: Center(
                      child: Text(
                        'PRECAUTIONS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
//                  width: 450.0,
                  ),
                ),
              ),
              CountriesCase(),
            ],
          ),
        ),
      ),
    );
  }
}

class WorldStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: WorldData().updateData(),
        stream: _ShowInfoState().updateData(),
        builder: (context, snapshots) {
          if (snapshots.hasError) {
            print(snapshots.error);
          }
          if (snapshots.hasData) {
            print(snapshots.data);
          }
          switch (snapshots.connectionState) {
            case ConnectionState.waiting:
              WorldData().updateData();
              return Text('Waiting...');
            case ConnectionState.active:
              WorldData().updateData();
              return Text('active');
            case ConnectionState.done:
              WorldData().updateData();
              return Text('Done');
            default:
              WorldData().updateData();
              return Text("None");
          }
        });
  }
}
