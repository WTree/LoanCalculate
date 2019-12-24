import 'package:intl/intl.dart';
class Utils{


  //保留两位小数
    static String formatNumber(double number){
    String style="#.##";

    NumberFormat numberFormat=new NumberFormat(style);

    return numberFormat.format(number);

  }

}