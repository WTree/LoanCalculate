


import 'package:loan_calc/member/LoanInfo.dart';



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