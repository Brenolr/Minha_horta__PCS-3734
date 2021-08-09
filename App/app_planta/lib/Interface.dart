  import 'models.dart';
  import 'package:charts_flutter/flutter.dart' as charts;

/// Create one series with sample hard coded data.
  List<charts.Series<TimeSeriesSales, DateTime>> getHumidity() {
    final data = [
      new TimeSeriesSales(new DateTime(2021, 9, 10, 8, 30), 70),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 8, 35), 61),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 8, 40), 54),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 8, 45), 51),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 8, 50), 42),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 8, 55), 63),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 00), 74),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 05), 69),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 10), 60),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 15), 56),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 20), 52),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 35), 46),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 40), 39),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 45), 61),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 50), 76),
      new TimeSeriesSales(new DateTime(2021, 9, 10, 9, 55), 67)
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
  class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
  