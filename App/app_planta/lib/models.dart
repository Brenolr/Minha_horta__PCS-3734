/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class Data {
  final List<double> temp;
  final List<double> light;
  final List<double> hum_air;
  final List<int> hum_soil;

  Data({
    this.temp,
    this.light,
    this.hum_air,
    this.hum_soil
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      temp: json['temp'],
      light: json['light'],
      hum_air: json['hum_air'],
      hum_soil: json['hum_soil'],
    );
  }
}