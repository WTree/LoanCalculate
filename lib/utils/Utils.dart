import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Utils{


  //保留两位小数
    static String formatNumber(double number){
    String style="#.##";

    NumberFormat numberFormat=new NumberFormat(style);

    return numberFormat.format(number);

  }


  static void closeKeybord(BuildContext context){

    FocusScope.of(context).requestFocus(FocusNode());
  }

    static int currentTimeMillis() {
      return new DateTime.now().millisecondsSinceEpoch;
    }

}