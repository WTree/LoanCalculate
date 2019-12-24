import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_calc/utils/ToastUtils.dart';
import 'package:loan_calc/view/date_drop_down.dart';
import 'package:loan_calc/view/rate_drop_down.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';
import 'package:loan_calc/member/LoanInfo.dart';
import 'package:loan_calc/utils/calc.dart';

class LoanActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoadPage(title: "test"),
    );
  }
}

class MyLoadPage extends StatefulWidget {
  final String title;

  MyLoadPage({Key key, this.title}) : super(key: key);

  @override
  _MyLoadPageState createState() => _MyLoadPageState();
}

/*



 */

class _MyLoadPageState extends State<MyLoadPage> {
  final TextEditingController _money_controller = new TextEditingController();
  final TextEditingController _time_controller = new TextEditingController();
  final TextEditingController _rate_controller = new TextEditingController();

  SpnnerControl _time_control=new SpnnerControl();
  SpnnerControl _rate_ctrl=new SpnnerControl();

  bool isCanInputRateMomey = false;
  double rateMoney = 0;

  void checkAndCalc(TapUpDetails details) {
    if (_money_controller.text.isEmpty) {
      showTaost("金额不能为空");
      return null;
    }

    if(_time_controller.text.isEmpty){
      showTaost("时间不能为空");
      return null;
    }

    if(_rate_controller.text.isEmpty){
      showTaost("利息不能为空");
      return null;
    }

    double money=double.parse(_money_controller.text);

    int time=int.parse(_time_controller.text);

    double rate=double.parse(_rate_controller.text);


    int rateType=RATE.YEAR;


    int timeType=TIME.YEAR;

    if("月"==_rate_ctrl.value){
      timeType=TIME.MONTH;
    }else if("日" == _rate_ctrl.value){
      timeType=TIME.DAY;
    }else{
      timeType=TIME.YEAR;
    }

    if("月息"==_rate_ctrl.value){
      rateType=RATE.MONTH;
    }else if("日息" == _rate_ctrl.value){
      rateType=RATE.DAY;
    }else{
      rateType=RATE.YEAR;
    }


    LoandInfo info=calc(money, rate, time, rateType, timeType);

    setState(() {
      rateMoney=info.interestTotal;
    });





  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  height: 48,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          obscureText: false,
                          //是否是密码
                          controller: _money_controller,
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
                          controller: _time_controller,
                          keyboardType: TextInputType.number,
                          //数字输入

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                          decoration: InputDecoration(hintText: "输入贷款时间"),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(width: 80, child: DateDropDown(_time_control))
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
                          controller: _rate_controller,
                          keyboardType: TextInputType.number,
                          //数字输入

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                          decoration: InputDecoration(hintText: "利率(%)"),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(width: 80, child: RateDropDown(_rate_ctrl)),
                    ],
                  )),
              SizedBox(height: 16),
              GestureDetector(
                child: SizedBox(
                    height: 48,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            obscureText: false,
                            //是否是密码

                            keyboardType: TextInputType.number,
                            //数字输入
                            enabled: isCanInputRateMomey,

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                            decoration: InputDecoration(
                                hintText: "利息", labelText: "$rateMoney"),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(width: 80, child: Center(child: Text("单位(元)")))
                      ],
                    )),
                onLongPress: () {
                  print(("长按事件"));
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
            ]),
      ),
    );
  }
}
