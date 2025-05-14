import 'package:hive_flutter/adapters.dart';

 write (String id, dynamic value) async {
  var valueBox = Hive.box('user');
  switch(id){
    case 'score':
      valueBox.put('score', value);
      break;
    case 'background':
      valueBox.put('background', value);
      break;
    case 'level':
      valueBox.put('level', value);
      break;
    case 'bird':
      valueBox.put('bird', value);
  }
}
 read(String id){
  var valueBox  = Hive.box('user');
  dynamic value;
  switch(id){
    case 'score':
     value = valueBox.get('score');
     break;
    case 'bacground':
      value = valueBox.get('background');
      break;
    case 'level':
      value = valueBox.get('level');
      break;
    case 'bird':
      value = valueBox.get('bird');
      break;
  }
  return value;

}