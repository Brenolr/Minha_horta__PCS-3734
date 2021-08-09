import 'package:flutter/material.dart';

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
    return (temp[temp.length - 1].toDouble());
  }

  List<dynamic> getLuzAll() {
    return (luz);
  }

  double getLuzRecent() {
    return (luz[luz.length - 1].toDouble());
  }

  List<dynamic> getUmidArAll() {
    return (umid_ar);
  }

  double getUmidArRecent() {
    return (umid_ar[umid_ar.length - 1].toDouble());
  }

  List<dynamic> getUmidSoloAll() {
    return (umid_solo);
  }

  double getUmidSoloRecent() {
    return (umid_solo[umid_solo.length - 1].toDouble());
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
      umid_solo_treash: json['umid_solo'],
    );
  }
  RangeValues getTempRange() {
    return (RangeValues(temp_treash[temp_treash.length - 1]['min_value'],
        temp_treash[temp_treash.length - 1]['max_value']));
  }

  void setTempRange(RangeValues range) {
    temp_treash[temp_treash.length - 1]['min_value'] = range.start;
    temp_treash[temp_treash.length - 1]['max_value'] = range.end;
  }
  RangeValues getUmidSoloRange() {
    return (RangeValues(umid_solo_treash[umid_solo_treash.length - 1]['min_value'],
        umid_solo_treash[umid_solo_treash.length - 1]['max_value']));
  }

  void setUmidSoloRange(RangeValues range) {
    umid_solo_treash[umid_solo_treash.length - 1]['min_value'] = range.start;
    umid_solo_treash[umid_solo_treash.length - 1]['max_value'] = range.end;
  }
  RangeValues getUmidArRange() {
    return (RangeValues(umid_ar_treash[umid_ar_treash.length - 1]['min_value'],
        umid_ar_treash[umid_ar_treash.length - 1]['max_value']));
  }

  void setUmidArRange(RangeValues range) {
    umid_ar_treash[umid_ar_treash.length - 1]['min_value'] = range.start;
    umid_ar_treash[umid_ar_treash.length - 1]['max_value'] = range.end;
  }
  RangeValues getLuzRange() {
    return (RangeValues(luz_treash[luz_treash.length - 1]['min_value'],
        luz_treash[luz_treash.length - 1]['max_value']));
  }

  void setLuzRange(RangeValues range) {
    luz_treash[luz_treash.length - 1]['min_value'] = range.start;
    luz_treash[luz_treash.length - 1]['max_value'] = range.end;
  }
}
