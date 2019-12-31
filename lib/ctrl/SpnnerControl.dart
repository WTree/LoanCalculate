
//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';


class SpnnerControl extends ValueNotifier {





  String textValue;



  set changeValue(String newValue){
    this.textValue=newValue;
    value=newValue;
  }

//  String selectValue;


  SpnnerControl():super(null);


}

