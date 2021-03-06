import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models.dart';
import 'server_interface.dart';

class SetAlarms extends StatefulWidget {
  @override
  _SetAlarmsState createState() => _SetAlarmsState();
}

class _SetAlarmsState extends State<SetAlarms> {
  late Future<Data> data;
  RangeValues _light_range = RangeValues(20, 40);
  RangeValues _humidity_air = RangeValues(20, 70);
  RangeValues _temperaturas = RangeValues(15, 30);
  ServerAPI api = ServerAPI();

  @override
  void initState() {
    super.initState();
    data = api.getValues();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: api.getValues(),
          builder: (BuildContext context, AsyncSnapshot<Data> snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: ListTile(
                      title: RangeSlider(
                        min: 0,
                        max: 50,
                        divisions: 100,
                        values: _temperaturas,
                        onChanged: (RangeValues values) {
                          _temperaturas = values;
                        },
                      ),
                      subtitle: Text(
                        'Temperatura:',
                      ),
                      leading: Icon(Icons.wb_sunny),
                      trailing: Text(
                        _temperaturas.start.toStringAsPrecision(3) +
                            "ºC - " +
                            _temperaturas.end.toStringAsPrecision(3) +
                            " ºC",
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: RangeSlider(
                          values: _humidity_air,
                          min: 0,
                          max: 100,
                          divisions: 100,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _humidity_air = values;
                            });
                          }),
                      subtitle: Text(
                        'Umidade:',
                      ),
                      leading: Icon(Icons.invert_colors),
                      trailing: Text(
                        _humidity_air.start.toString() +
                            "% - " +
                            _humidity_air.end.toString() +
                            " %",
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: RangeSlider(
                        min: 0,
                        max: 60,
                        divisions: 60,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _light_range = values;
                          });
                        },
                        values: _light_range,
                      ),
                      subtitle: Text(
                        'Lumisidade:',
                      ),
                      leading: Icon(Icons.wb_sunny),
                      trailing: Text(
                        _light_range.start.toStringAsPrecision(3) +
                            "L - " +
                            _light_range.end.toStringAsPrecision(3) +
                            " L",
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
