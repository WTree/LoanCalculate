import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';
import 'package:loan_calc/member/LoanInfo.dart';
import 'package:loan_calc/utils/ToastUtils.dart';
import 'package:loan_calc/utils/Utils.dart';
import 'package:loan_calc/utils/calc.dart';
import 'package:loan_calc/view/MoneyCalcPage.dart';
import 'package:loan_calc/view/NormalCalcPage.dart';
import 'package:loan_calc/view/date_drop_down.dart';
import 'package:loan_calc/view/rate_drop_down.dart';
import 'package:loan_calc/view/loan_page.dart';

class TestActivity extends StatelessWidget {

  bool isOK=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '贷款计算器',


      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyLoadPage(title: "贷款计算器"),
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


  bool isNormal=false;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by

        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[

         Switch(value: isNormal,onChanged:(value){
            setState(() {

              isNormal=value;
            });
         })

        ],
      ),
      body:

      !isNormal?NormalCalcPage():MoneyCalcPage(),
    );
  }
}
