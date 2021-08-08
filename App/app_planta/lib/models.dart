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

  List<dynamic> getLuzAll() {
    return (luz);
  }

  double getLuzRecent() {
    return (luz[0].toDouble());
  }

  List<dynamic> getUmidArAll() {
    return (umid_ar);
  }

  double getUmidArRecent() {
    return (umid_ar[0].toDouble());
  }

  List<dynamic> getUmidSoloAll() {
    return (umid_solo);
  }

  double getUmidSoloRecent() {
    return (umid_solo[0].toDouble());
  }
}

class DataThreshold {
  final List<dynamic> temp_treash;
  final List<dynamic> luz_treash;
  final List<dynamic> umid_ar_treash;
  final List<dynamic> umid_solo_treash;

  DataThreshold(
      {required this.temp_treash,
      required this.luz_treash,
      required this.umid_ar_treash,
      required this.umid_solo_treash});

  factory DataThreshold.fromJson(Map<String, dynamic> json) {
    return DataThreshold(
      umid_ar_treash: json['umid_ar'],
      luz_treash: json['luz'],
      temp_treash: json['temp'],
      umid_solo_treash: json['umid'],
    );
  }
}


