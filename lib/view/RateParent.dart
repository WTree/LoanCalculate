import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';
import 'package:loan_calc/view/MoneyCalcPage.dart';
import 'package:loan_calc/view/MoneyCalcRealPage.dart';
import 'package:loan_calc/view/rate_parent_drop_down.dart';

class RateParentPage extends StatefulWidget {
  RateParentPage({Key key}) : super(key: key);

  @override
  _RateParentPageState createState() => _RateParentPageState();
}

class _RateParentPageState extends State<RateParentPage>
    with AutomaticKeepAliveClientMixin {
  SpnnerControl spnnerRateCtrl = new SpnnerControl();

  bool isCanInputRateMomey = false;
  double rateMoney = 0;
  String displayDetail = "";

  bool isNormal = false;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    spnnerRateCtrl.addListener(changeUI);
  }

  void changeUI() {
    if ("先息后金" == spnnerRateCtrl.value) {
      setState(() {
        isNormal = false;
      });
    } else {
      setState(() {
        isNormal = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context); //不然 状态不能保存

    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
          child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(width: 150,child: RateDropDownParent(spnnerRateCtrl)) ,
              )),
        ),
        !isNormal ? MoneyCalcPage() : MoneyCalcRealPage()
      ],
    );
  }
}
