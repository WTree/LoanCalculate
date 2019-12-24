import 'package:loan_calc/utils/Utils.dart';
class LoandInfo{
  //每天的利息
   double interestDay;

   // * 每月的利息
   //   * 一个月按照30天计算
   double interestMonth;


   //每年的利息
   double interestYear;

   //总的利息
   double interestTotal;


   // 本金
   double baseMoney;


   //是否利滚利
   bool isRoll=false;


   //年利率
   double yearRate;

    String toString() {

      StringBuffer sb=new StringBuffer();
//     sb.write("本金:"+Utils.formatNumber(baseMoney)+"元");
//     sb.write("\n总的利息:"+ Utils.formatNumber(interestTotal)+"元");
     sb.write("年利率:"+Utils.formatNumber(yearRate*100)+" %"+"元");
     if(interestYear!=0){
       sb.write("\n一年的利息:"+Utils.formatNumber(interestYear)+"元");
     }
     if(interestMonth!=0){
       sb.write("\n一月的利息:"+Utils.formatNumber(interestMonth)+"元");
     }
     if(interestDay!=0){
       sb.write("\n日息:"+Utils.formatNumber(interestDay)+"元");
     }

     if(!isRoll){
       sb.write("\n[非利滚利的算法] \n标准:以月30为天，年365\n注意:年利率大于36%就属于高利贷了");
     }
     return sb.toString();
   }

}

 class TIME{

   static const  a=2;
   static const YEAR=1;
   static const MONTH=2;
   static const DAY=3;
}

  class RATE{
    static const YEAR=1;
    static const MONTH=2;
    static const DAY=3;
}