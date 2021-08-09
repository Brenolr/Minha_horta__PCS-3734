import 'package:app_planta/models.dart';
import 'package:app_planta/server_interface.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'Interface.dart';

class Graphs extends StatefulWidget {
  @override
  _GraphsState createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  late Future<Data> data;

  ServerAPI api = ServerAPI();

  @override
  void initState() {
    super.initState();
    data = api.getValues();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text("Umidade do Solo", style: TextStyle(
                                              fontSize: 25, color: Colors.black)),
              ),
              Container(
                  height: 600, child: charts.TimeSeriesChart(getHumidity())),
            ],
          )),
    );
  }
}
