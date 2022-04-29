import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'home.dart';
import 'package:ui/screens/Info.dart';

class StudentChart extends StatelessWidget {
  final List<Studentstats> data;

  StudentChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Studentstats, String>> series = [
      charts.Series(
          id: "stats",
          data: data,
          domainFn: (Studentstats series, _) => series.info,
          measureFn: (Studentstats series, _) => series.measure,
          colorFn: (Studentstats series, _) => series.barColor)
    ];

    return Container(
      color: Colors.transparent,
      height: 200,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                  vertical: false,
                  barGroupingType: charts.BarGroupingType.stacked,
                  defaultRenderer: new charts.BarRendererConfig(
                      groupingType: charts.BarGroupingType.stacked,
                      strokeWidthPx: 0.8,
                      maxBarWidthPx: 50,
                      minBarLengthPx: 50),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                      renderSpec: charts.NoneRenderSpec()),
                  domainAxis: new charts.OrdinalAxisSpec(
                      renderSpec: new charts.NoneRenderSpec()),
                  barRendererDecorator: charts.BarLabelDecorator(
                      insideLabelStyleSpec: charts.TextStyleSpec(fontSize: 20),
                      labelPosition: charts.BarLabelPosition.inside),
                  behaviors: [
                    charts.DatumLegend(
                      outsideJustification:
                          charts.OutsideJustification.endDrawArea,
                      horizontalFirst: true,
                      entryTextStyle: charts.TextStyleSpec(
                        color: charts.Color.black,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
