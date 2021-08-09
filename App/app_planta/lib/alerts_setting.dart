import 'package:app_planta/server_provider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';
import 'server_interface.dart';
import 'package:weather_icons/weather_icons.dart';

class SetAlarms extends StatefulWidget {
  @override
  _SetAlarmsState createState() => _SetAlarmsState();
}

class _SetAlarmsState extends State<SetAlarms> {
  @override
  void initState() {
    super.initState();
    final data = Provider.of<DataProvider>(context, listen: false);
    data.fetchData();

    final threshold =
        Provider.of<DataThresholdProvider>(context, listen: false);
    threshold.fetchThresholdData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    final threshold = Provider.of<DataThresholdProvider>(context);
    return Center(
        child: data.loading // || threshold.loading
          ? Container(
              child: CircularProgressIndicator(),
            )
          : Column(
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
                              style:
                                  TextStyle(fontSize: 30, color: Colors.grey),
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              data.data.getTempRecent().toStringAsPrecision(3) +
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
                    values: threshold.datathreshold.getTempRange(),
                    onChanged: (RangeValues values) {
                      setState(() {
                        threshold.datathreshold.setTempRange(values);
                        EasyDebounce.debounce('debouncer2', Duration(milliseconds: 500), () =>threshold.sendThresholdData(threshold.datathreshold));
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        threshold.datathreshold.getTempRange().start.toStringAsPrecision(3) +
                            "Cº - " +
                            threshold.datathreshold.getTempRange().end.toStringAsPrecision(3) +
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
                              style:
                                  TextStyle(fontSize: 30, color: Colors.grey),
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              data.data
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
                    values: threshold.datathreshold.getUmidArRange(),
                    onChanged: (RangeValues values) {
                      setState(() {
                        threshold.datathreshold.setUmidArRange(values);
                        EasyDebounce.debounce('debouncer3', Duration(milliseconds: 500), () =>threshold.sendThresholdData(threshold.datathreshold));
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        threshold.datathreshold.getUmidArRange().start.toStringAsPrecision(3) +
                            "% - " +
                            threshold.datathreshold.getUmidArRange().end.toStringAsPrecision(3) +
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
                              style:
                                  TextStyle(fontSize: 30, color: Colors.grey),
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              data.data.getLuzRecent().toStringAsPrecision(3) +
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
                    values: threshold.datathreshold.getLuzRange(),
                    onChanged: (RangeValues values) {
                      setState(() {
                        threshold.datathreshold.setLuzRange(values);
                        EasyDebounce.debounce('debouncer4', Duration(milliseconds: 500), () =>threshold.sendThresholdData(threshold.datathreshold));
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        threshold.datathreshold.getLuzRange().start.toStringAsPrecision(3) +
                            "L - " +
                            threshold.datathreshold.getLuzRange().end.toStringAsPrecision(3) +
                            " L",
                        style: TextStyle(color: Colors.grey)),
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
