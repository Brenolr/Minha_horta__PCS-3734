import 'package:app_planta/models.dart';
import 'package:app_planta/server_interface.dart';
import 'package:app_planta/server_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:easy_debounce/easy_debounce.dart';

class SetHumidity extends StatefulWidget {
  @override
  _SetHumidityState createState() => _SetHumidityState();
}

class _SetHumidityState extends State<SetHumidity> {
  RangeValues _humidity_soil = RangeValues(20, 70);

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
                                    WeatherIcons.raindrop,
                                    color: Colors.grey,
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Umidade do Solo: ',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.grey),
                                    )),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      data.data
                                              .getUmidSoloRecent()
                                              .toStringAsPrecision(3) +
                                          "%",
                                      style: TextStyle(
                                        fontSize: 30,
                                      )),
                                )
                              ],
                            ),
                          ),
                          RangeSlider(
                            min: 0,
                            max: 100,
                            divisions: 100,
                            values: threshold.datathreshold.getUmidSoloRange(),
                            onChanged: (RangeValues values) {
                              setState(() {
                                threshold.datathreshold
                                    .setUmidSoloRange(values);
                                 EasyDebounce.debounce('debouncer1', Duration(milliseconds: 500), () =>threshold.sendThresholdData(threshold.datathreshold));
                              });
                            },
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                threshold.datathreshold.getUmidSoloRange().start.toStringAsPrecision(3) +
                                    "% - " +
                                    threshold.datathreshold.getUmidSoloRange().end.toStringAsPrecision(3) +
                                    " %",
                                style: TextStyle(color: Colors.grey)),
                          )
                        ],
                      ),
                    )),
              ],
            ),
    );
  }
}
