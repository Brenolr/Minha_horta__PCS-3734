import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models.dart';
import 'server_interface.dart';
import 'package:weather_icons/weather_icons.dart';

class SetAlarms extends StatefulWidget {
  @override
  _SetAlarmsState createState() => _SetAlarmsState();
}

class _SetAlarmsState extends State<SetAlarms> {
  late Future<Data> data;
  late Future<DataThreshold> datatreshold;
  RangeValues _light_range = RangeValues(20, 40);
  RangeValues _humidity_air = RangeValues(20, 70);
  RangeValues _temperaturas = RangeValues(15, 30);
  ServerAPI api = ServerAPI();

  @override
  void initState() {
    super.initState();
    data = api.getValues();
    datatreshold = api.getLimits();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: data,
          builder: (BuildContext context, AsyncSnapshot<Data> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: BoxedIcon(
                                      WeatherIcons.thermometer,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Temperatura: ",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.grey),
                                      )),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        snapshot.data!
                                                .getTempRecent()
                                                .toStringAsPrecision(3) +
                                            "Cº",
                                        style: TextStyle(
                                          fontSize: 35,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            RangeSlider(
                              min: 0,
                              max: 50,
                              divisions: 100,
                              values: _temperaturas,
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _temperaturas = values;
                                });
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  _temperaturas.start.toStringAsPrecision(3) +
                                      "Cº - " +
                                      _temperaturas.end.toStringAsPrecision(3) +
                                      " Cº",
                                  style: TextStyle(color: Colors.grey)),
                            )
                          ],
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: BoxedIcon(
                                      WeatherIcons.raindrop,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Umidade: ',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.grey),
                                      )),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        snapshot.data!
                                                .getUmidArRecent()
                                                .toStringAsPrecision(3) +
                                            "%",
                                        style: TextStyle(
                                          fontSize: 35,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            RangeSlider(
                              min: 0,
                              max: 100,
                              divisions: 100,
                              values: _humidity_air,
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _humidity_air = values;
                                });
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  _humidity_air.start.toStringAsPrecision(3) +
                                      "% - " +
                                      _humidity_air.end.toStringAsPrecision(3) +
                                      " %",
                                  style: TextStyle(color: Colors.grey)),
                            )
                          ],
                        ),
                      )),
                  Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: BoxedIcon(
                                      WeatherIcons.day_sunny,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Lumisidade: ',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.grey),
                                      )),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                        snapshot.data!
                                                .getLuzRecent()
                                                .toStringAsPrecision(3) +
                                            "L",
                                        style: TextStyle(
                                          fontSize: 35,
                                        )),
                                  )
                                ],
                              ),
                            ),
                            RangeSlider(
                              min: 0,
                              max: 100,
                              divisions: 100,
                              values: _light_range,
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _light_range = values;
                                });
                              },
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  _light_range.start.toStringAsPrecision(3) +
                                      "L - " +
                                      _light_range.end.toStringAsPrecision(3) +
                                      " L",
                                  style: TextStyle(color: Colors.grey)),
                            )
                          ],
                        ),
                      )),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
