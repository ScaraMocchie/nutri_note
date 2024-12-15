import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/controller/sevenList_generator.dart';
import 'package:nutri_note/widget/chart_bar/bar_data.dart';


class MyBarGraph extends StatelessWidget {
  final List<int> list;
  final Color mainColor;
  final Color subColor;
   MyBarGraph({super.key, required this.list, required this.mainColor, required this.subColor});

  

  double maxYGen(List<double> list){
    if (list.length == 0){
      return 1500;
    }
    double hasil = (list.reduce(max)>0)
    ?list.reduce(max)*120/100
    :100;
    return hasil;
  }

  List<double> makeItDouble(List list){
    List<double> hasil = [];
    for(int i in list){
      hasil.add(i.toDouble());
    }
    return hasil;
  }

  
  // final List<double> listdouble = [80.0, 10.0, 14.0, 15.0, 13.0, 10.0, 16.0];
  @override
  Widget build(BuildContext context) {
    List<double> listdouble = makeItDouble(sevenListGenerator(list));

    

    BarData myBarData = BarData(
      one: listdouble[0], 
      two: listdouble[1], 
      three: listdouble[2], 
      four: listdouble[3], 
      five: listdouble[4], 
      six: listdouble[5], 
      seven: listdouble[6]);
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
      maxY: maxYGen(listdouble).toDouble(),
      // maxY: 100,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))
      ),
      barGroups: myBarData.barData.map((data) => BarChartGroupData(
        x: data.x,
        barRods: [
          BarChartRodData(
            toY: data.y,
            color: Color(0xffFE4E33),
            width: 35,
            borderRadius: BorderRadius.circular(10),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              // toY: maxYGen(list).toDouble(),
              toY: maxYGen(listdouble).toDouble(),
              // toY: 100,
              color: Color(0xffFFCCC4)
            ))
        ])).toList()
    )
    );
  }
}