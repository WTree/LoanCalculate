import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';
import 'package:loan_calc/member/LoanInfo.dart';
import 'package:loan_calc/utils/ToastUtils.dart';
import 'package:loan_calc/utils/Utils.dart';
import 'package:loan_calc/utils/calc.dart';
import 'package:loan_calc/view/rate_reverse_drop_down.dart';

class MoneyCalcRealPage extends StatefulWidget {
  MoneyCalcRealPage({Key key}) : super(key: key);

  @override
  _MoneyCalcRealPageState createState() => _MoneyCalcRealPageState();
}

class _MoneyCalcRealPageState extends State<MoneyCalcRealPage>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController moneyController = new TextEditingController();
  final TextEditingController rateController = new TextEditingController();
  final TextEditingController numberController = new TextEditingController();

  SpnnerControl spnnerRateCtrl = new SpnnerControl();

  bool isCanInputRateMomey = false;
  double rateMoney = 0;
  String displayDetail = "";

  bool isNormal = false;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  String rateTypeStr = "月供";

  @override
  void initState() {
    super.initState();

    spnnerRateCtrl.addListener(() {
      setState(() {
        rateTypeStr = spnnerRateCtrl.textValue;
      });
    });
  }

  void checkAndCalc(TapUpDetails details) async {
    Utils.closeKeybord(context);
    if (moneyController.text.isEmpty) {
      showTaost("金额不能为空");
      return null;
    }

    if (rateController.text.isEmpty) {
      showTaost("月供不能为空");
      return null;
    }
    if (numberController.text.isEmpty) {
      showTaost("贷款期数不能为空");
      return null;
    }

    double money = double.parse(moneyController.text);

    double avaMoney = double.parse(rateController.text);

    int number = double.parse(numberController.text).toInt();

    if (money == 0) {
      showTaost("金额不能为0");
      return null;
    }

    if (avaMoney == 0) {
      showTaost("月供不能为0");
      return null;
    }
    if (number == 0) {
      showTaost("贷款期数不能为0");
      return null;
    }

    int rateType = RATE.YEAR;

    print(spnnerRateCtrl.value);
    if ("日供" == spnnerRateCtrl.value) {
      rateType = RATE.DAY;
    } else {
      rateType = RATE.MONTH;
    }

    double rateYear = await calcRateHight(money, avaMoney, number, rateType);

    rateYear *= 100;

    String temp = Utils.formatNumber(rateYear);
    setState(() {
      this.displayDetail = "年利率 ≈ $temp %";
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context); //不然 状态不能保存

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        SizedBox(
          height: 36,
          child: Container(
              color: Colors.black12,
              child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "真实利息计算年化(用于了解贷款的真实利率)",
                    style: TextStyle(color: Colors.black45),
                  ))),
        ),
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
                    controller: rateController,
                    keyboardType: TextInputType.number,
                    //数字输入

//                          inputFormatters:[WhitelistingTextInputFormatter.digitsOnly] ,
                    decoration: InputDecoration(hintText: "$rateTypeStr (元)"),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(width: 80, child: RateReverseDropDown(spnnerRateCtrl)),
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
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    //数字输入

                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(hintText: "贷款期数"),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(width: 80, child: Text("$rateTypeStr次数")),
              ],
            )),
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
    );
  }
}
