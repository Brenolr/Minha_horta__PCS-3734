import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class SetHumidity extends StatefulWidget {
  @override
  _SetHumidityState createState() => _SetHumidityState();
}

class _SetHumidityState extends State<SetHumidity> {
  RangeValues _humidity_soil = RangeValues(20, 70);

  @override
  void initState() {
    super.initState();
    _showMyDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
                                'Umidade: ',
                                style:
                                    TextStyle(fontSize: 30, color: Colors.grey),
                              )),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                                "123"
                                // snapshot.data!
                                //         .getUmidArRecent()
                                //         .toStringAsPrecision(3) +
                                //     "%",
                                ,
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
                      values: _humidity_soil,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _humidity_soil = values;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          _humidity_soil.start.toStringAsPrecision(3) +
                              "% - " +
                              _humidity_soil.end.toStringAsPrecision(3) +
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Esse APP tá muito feio'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Eu sei que está feio, vou arrumar depois'),
                Text('ok ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
