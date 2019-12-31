

import 'package:loan_calc/member/LoanInfo.dart';

import 'dart:math';
import 'package:loan_calc/utils/Utils.dart';

LoandInfo calcRate(double money,double rateMoney,int rateType){

  LoandInfo info=new LoandInfo();

  info.baseMoney=money;

  double rate=rateMoney/money;
  switch(rateType){

    case RATE.DAY:{

      info.interestDay=rateMoney;
      info.interestMonth=rateMoney*30;
      info.interestYear=rateMoney*365;
      info.yearRate=rate*365;

      break;
    }

    case RATE.MONTH:{
      info.interestDay=rateMoney/30;
      info.interestMonth=rateMoney;
      info.interestYear=rateMoney*12;
      info.yearRate=rate*12;

      break;
    }

    case RATE.YEAR:{
      info.interestDay=rateMoney/365;
      info.interestMonth=rateMoney/12;
      info.interestYear=rateMoney;
      info.yearRate=rate;
      break;
    }
  }


  return info;


}

//具体算法没有找到,只能通过极限求值法来解决，

 calcRateHight(double totalMoney,double avaMoney,int time,int rateType) async{


  double avaLocalMoney=avaMoney-totalMoney/time;

  LoandInfo info=calcRate(totalMoney, avaLocalMoney, rateType);

  double rateYear=0.0;


  if(rateType==RATE.MONTH){

    var rate=await calcRateImpl(totalMoney, avaMoney, time, info.yearRate/12);
    rateYear=rate*12;


  }else{
    var rate=await calcRateImpl(totalMoney, avaMoney, time, info.yearRate/365);
    rateYear=rate*365;
  }

  return rateYear;

}

//in thread
 calcRateImpl(double totalMoney,double avaMoney,int number,double startRate) async{



  int t1=Utils.currentTimeMillis();
//  var rate=(startRate-3)<0?0:(startRate-3);
   double rate=startRate;
  double temp=0.0;
   double stage=0.0001;

  do{
    temp=caclAverageMoney(totalMoney, rate, number);
    if(temp>avaMoney){
      break;
    }
    rate+=stage;
  }while(((temp-avaMoney).abs()>0.5));

   int t2=Utils.currentTimeMillis();

   print("eat time:"+(t2-t1).toString());
  return rate;

}



LoandInfo calc(double money,double rate,int time,int rateType,int timeType){

  LoandInfo info=new LoandInfo();

  info.baseMoney=money;
  rate/=100;
  double res=money*rate;
  switch(rateType){

  }
  switch (rateType){
    case RATE.DAY:
      info.interestDay=res;
      info.interestMonth=res*30;
      info.interestYear=info.interestMonth*12;
      info.yearRate=rate*365;
      break;
    case RATE.MONTH:
      info.interestMonth=res;
      info.interestDay=res/30;
      info.interestYear=info.interestMonth*12;
      info.yearRate=rate*12;
      break;
    default:
      info.interestYear=res;
      info.interestMonth=res/12;
      info.interestDay=res/365;
      info.yearRate=rate;
      break;
  }
  switch (timeType){
    case TIME.DAY:
      info.interestTotal=info.interestDay*time;
      break;
    case TIME.MONTH:
      info.interestTotal=info.interestMonth*time;
      break;
    default:
      info.interestTotal=info.interestYear*time;
      break;
  }
  return info;


}



double caclAverageMoney(double totalMoney,double rate,int number){
  double result= 0.0;

  result = (totalMoney * (rate * pow((1 + rate), number.toDouble()))) / (pow((1 + rate), number.toDouble()) - 1);

  return result;
}