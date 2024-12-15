List<int> sevenListGenerator(List<int> list){
  List<int> _list = list;
  if(list.length == 7){
    return list;
  } else if (list.length>7){
    return  list.sublist(7);
  }
  while(list.length<7){
    _list.add(0);
  }
  return _list;
}

List<double> sevenListGeneratorDouble(List<double> list){
  List<double> _list = list;
  if(list.length == 7){
    return list;
  } else if (list.length>7){
    return  list.sublist(7);
  }
  while(list.length<7){
    _list.add(0);
  }
  return _list;
}