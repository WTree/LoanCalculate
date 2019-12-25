import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';
import 'package:loan_calc/member/LoanInfo.dart';
import 'package:loan_calc/utils/ToastUtils.dart';
import 'package:loan_calc/utils/Utils.dart';
import 'package:loan_calc/utils/calc.dart';
import 'package:loan_calc/view/date_drop_down.dart';
import 'package:loan_calc/view/rate_drop_down.dart';
class NormalCalcPage extends StatefulWidget{

  NormalCalcPage({Key key}) : super(key: key);

  @override
  _NormalCalcPageState createState() => _NormalCalcPageState();

}


class _NormalCalcPageState extends State<NormalCalcPage> {
  final TextEditingController moneyController = new TextEditingController();
  final TextEditingController timeController = new TextEditingController();
  final TextEditingController rateController = new TextEditingController();

  SpnnerControl spnnerTimeControl = new SpnnerControl();
  SpnnerControl spnnerRateCtrl = new SpnnerControl();

  bool isCanInputRateMomey = false;
  double rateMoney = 0;
  String displayDetail = "";

  bool isNormal=false;

  @override
  void initState() {
    super.initState();

    rateController.addListener(() {});
  }

  void checkAndCalc(TapUpDetails details) {
    Utils.closeKeybord(context);
    if (moneyController.text.isEmpty) {
      showTaost("金额不能为空");
      return null;
    }

    if (timeController.text.isEmpty) {
      showTaost("时间不能为空");
      return null;
    }

    if (rateController.text.isEmpty) {
      showTaost("利息不能为空");
      return null;
    }

    double money = double.parse(moneyController.text);

    int time = int.parse(timeController.text);

    double rate = double.parse(rateController.text);

    int rateType = RATE.YEAR;

    int timeType = TIME.YEAR;

    if ("月" == spnnerTimeControl.value) {
      timeType = TIME.MONTH;
    } else if ("日" == spnnerTimeControl.value) {
      timeType = TIME.DAY;
    } else {
      timeType = TIME.YEAR;
    }

    if ("月息" == spnnerRateCtrl.value) {
      rateType = RATE.MONTH;
    } else if ("日息" == spnnerRateCtrl.value) {
      rateType = RATE.DAY;
    } else {
      rateType = RATE.YEAR;
    }

    LoandInfo info = calc(money, rate, time, rateType, timeType);

    setState(() {
      rateMoney = info.interestTotal;
      displayDetail = info.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:


      Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          SizedBox(
              height: 48,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      //是否是密码
                      controller: moneyController,
                      keyboardType: TextInputType.number,
                      //数字输入

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                      decoration: InputDecoration(hintText: "贷款金额"),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(width: 80, child: Center(child: Text("单位(元)")))
                ],
              )),
          SizedBox(height: 16),
          SizedBox(
              height: 48,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      //是否是密码
                      controller: timeController,
                      keyboardType: TextInputType.number,
                      //数字输入

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                      decoration: InputDecoration(hintText: "输入贷款时间"),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(width: 80, child: DateDropDown(spnnerTimeControl))
                ],
              )),
          SizedBox(height: 16),
          SizedBox(
              height: 48,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      //是否是密码
                      controller: rateController,
                      keyboardType: TextInputType.number,
                      //数字输入

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                      decoration: InputDecoration(hintText: "利率(%)"),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(width: 80, child: RateDropDown(spnnerRateCtrl)),
                ],
              )),
          SizedBox(height: 16),
          GestureDetector(
            child: SizedBox(
                height: 48,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        width: 60,
                        child: GestureDetector(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("总利息:",
                                  style: TextStyle(color: Colors.black45))),

                          onLongPress: (){
                            showTaost("长按");
                          },

                        )),
                    Expanded(
                      child: TextField(
                        obscureText: false,
                        //是否是密码
                        autofocus: false,

                        keyboardType: TextInputType.number,
                        //数字输入
                        enabled: isCanInputRateMomey,
                        enableInteractiveSelection: false,

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                        decoration: InputDecoration(
                            hintText: "利息", labelText: "$rateMoney"),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(width: 80, child: Center(child: Text(" 单位(元)")))
                  ],
                )),
            onDoubleTap: () {
              showTaost("onDoubleTap press");
            },
            onLongPress: () {
              print(("长按事件"));
              showTaost("long press");
              setState(() {
                isCanInputRateMomey = true;
              });
            },
          ),
          SizedBox(height: 16),
          GestureDetector(
            child: Container(
              color: Colors.deepOrange,
              child: SizedBox(
                width: 200,
                height: 56,
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "计算",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
            ),
            onTapUp: checkAndCalc,
          ),
          SizedBox(height: 16),
          SizedBox(
              height: 150,
              child: SingleChildScrollView(child: Text("$displayDetail")))
        ]),
      ),
    );
  }
}