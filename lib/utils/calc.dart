


import 'package:loan_calc/member/LoanInfo.dart';

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