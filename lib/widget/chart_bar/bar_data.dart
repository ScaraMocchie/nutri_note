import 'package:nutri_note/widget/chart_bar/individual_bar.dart';

class BarData{
  final double one, two, three, four, five, six, seven;
  BarData({
    required this.one,
    required this.two,
    required this.three,
    required this.four,
    required this.five,
    required this.six,
    required this.seven,
  });

  List<individualBar> barData = [];

  void initializeBarData() {
  barData = [
    individualBar(x: 0, y: one),
    individualBar(x: 1, y: two),
    individualBar(x: 2, y: three),
    individualBar(x: 3, y: four),
    individualBar(x: 4, y: five),
    individualBar(x: 5, y: six),
    individualBar(x: 6, y: seven),
  ];
}

}