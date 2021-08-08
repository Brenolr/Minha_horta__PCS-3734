/// Sample ordinal data type.
class OrdinalSales {
  final int year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class Data {
  final List<dynamic> temp;
  final List<dynamic> luz;
  final List<dynamic> umid_ar;
  final List<dynamic> umid_solo;

  Data(
      {required this.temp,
      required this.luz,
      required this.umid_ar,
      required this.umid_solo});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      umid_ar: json['umid_ar'],
      luz: json['luz'],
      temp: json['temp'],
      umid_solo: json['umid_solo'],
    );
  }
  List<dynamic> getTempAll() {
    return (temp);
  }

  double getTempRecent() {
    return (temp[0].toDouble());
  }
}

class Data_treash {
  final List<double> temp_treash;
  final List<double> luz_treash;
  final List<double> umid_ar_treash;
  final List<int> umid_solo_treash;

  Data_treash(
      {required this.temp_treash,
      required this.luz_treash,
      required this.umid_ar_treash,
      required this.umid_solo_treash});

  factory Data_treash.fromJson(Map<String, dynamic> json) {
    return Data_treash(
      umid_ar_treash: json['umid_ar'],
      luz_treash: json['luz'],
      temp_treash: json['temp'],
      umid_solo_treash: json['umid'],
    );
  }
}
