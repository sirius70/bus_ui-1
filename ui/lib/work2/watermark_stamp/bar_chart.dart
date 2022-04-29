import 'package:flutter/material.dart';
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<charts.Series<dynamic, String>> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
    final desktopSalesData = [
      Sales("2015", random.nextInt(100), Color(0xff038c8c), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("2016", random.nextInt(100), Color(0xff666dad), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("2017", random.nextInt(100), Colors.lightBlueAccent, LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
      Sales("2018", random.nextInt(100), Color(0xff038c8c), LinearGradient(
        colors: <Color>[
          Color(0xff038c8c), Color(0xff666dad)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),),
    ];

    return [charts.Series<Sales, String>(
      id: "Sales",
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.sales,
      colorFn: (Sales sales, _) => charts.ColorUtil.fromDartColor(sales.color),
      data: desktopSalesData,
        // fillColorFn: (Sales, _){
        //   return (Sales.year == '2016')
        //       ? charts.MaterialPalette.red.shadeDefault
        //       : charts.MaterialPalette.blue.shadeDefault;
        // }

    )];
  }

  barChart(){
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.stacked,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.stacked,
        strokeWidthPx: 1.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: new charts.NoneRenderSpec()),
      behaviors: [
        charts.DatumLegend(
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: true,
          entryTextStyle: charts.TextStyleSpec(
            color: charts.Color.black,

          ),
        )
      ],

    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      //color: Colors.white,
      padding: EdgeInsets.all(20),
      child:barChart(),
    );
  }
}

class Sales {
  final String year;
  final int sales;
  final Color color;
  final Gradient gradient;


  Sales(this.year, this.sales, this.color, this.gradient);

}