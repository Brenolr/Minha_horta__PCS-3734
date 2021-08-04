import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'Interface.dart';

class Graphs extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  Graphs(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory Graphs.withSampleData() {
    return new Graphs(
      getHumidity(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }


}

