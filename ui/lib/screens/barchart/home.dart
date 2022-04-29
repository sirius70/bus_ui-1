import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Studentstats {
  final String info;
  final int measure;
  final charts.Color barColor;

  Studentstats(
      {required this.info, required this.measure, required this.barColor});
}
