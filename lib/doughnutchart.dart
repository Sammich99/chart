import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: SfCircularChart(
        title: ChartTitle(text: 'Continet wise GDP - 2021 \n (in billions of USD)'),
        legend: 
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
       // RadialBarSeries<GDPData, String>(
        // PieSeries<GDPData, String>(
          DoughnutSeries<GDPData, String>(
          dataSource: _chartData,
          xValueMapper: (GDPData data,_) => data.continent,
          yValueMapper: (GDPData data,_) => data.gdp,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          enableTooltip: true),
          //maximumValue: 40000),


        
      ],),
    ));
  }

  List<GDPData> getChartData(){

    final List<GDPData> chartData = [
      GDPData('Oceania', 1800),
      GDPData('Africa', 2490),
      GDPData('S America', 2900),
      GDPData('Europe', 23050),
      GDPData('N America', 24880),
      GDPData('Asia', 34390),
  


    ];
    return chartData;
  } 
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}