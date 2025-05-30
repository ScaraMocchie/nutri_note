import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutri_note/controller/dataUser_controller.dart';
import 'package:nutri_note/controller/sevenList_generator.dart';
import 'package:nutri_note/widget/chart_bar/bar_data.dart';


class MyBarGraph2 extends StatelessWidget {
  final List<double> list;
  final Color mainColor;
  final Color subColor;
   MyBarGraph2({super.key, required this.list, required this.mainColor, required this.subColor});

  

  double maxYGen(List<double> list){
    if (list.isEmpty){
      return 1500;
    }
    double hasil = (list.reduce(max)>0)
    ?(list.reduce(max)+1)
    :100;
    return hasil;
  }

  double minYGen(List<double> list){
    if (list.isEmpty){
      return 1500;
    }
    List<double> listTemp = list; 
    listTemp.removeWhere((number) => number == 0); 
    double hasil = listTemp.reduce(min)-1;
    print(listTemp.reduce(min)-1);
    return hasil;
  }


  
  // final List<double> listdouble = [80.0, 10.0, 14.0, 15.0, 13.0, 10.0, 16.0];
  @override
  Widget build(BuildContext context) {
    List<double> listdouble = sevenListGeneratorDouble(list);

    

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
      maxY: maxYGen(list),
      // maxY: 100,
      minY: minYGen(list),
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
            color: mainColor,
            width: 35,
            borderRadius: BorderRadius.circular(10),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              // toY: maxYGen(list).toDouble(),
              toY: maxYGen(list),
              color: subColor,
            ))
        ])).toList()
    )
    );
  }
}