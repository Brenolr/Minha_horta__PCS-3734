import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'Interface.dart';

class Graphs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(getHumidity());
  }
}
