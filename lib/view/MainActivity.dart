import 'package:flutter/material.dart';
import 'package:loan_calc/view/NormalCalcPage.dart';
import 'package:loan_calc/view/RateParent.dart';

class MainActivity extends StatelessWidget {
  bool isOK = false;

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

class _MyLoadPageState extends State<MyLoadPage>
    with AutomaticKeepAliveClientMixin {
  List<Widget> pages ;
  bool isMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(pages==null){
      pages = [NormalCalcPage(), RateParentPage()];
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by

        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          Switch(
              value: isMore,
              onChanged: (value) {
                setState(() {
                  isMore = value;
                });
              })
        ],
      ),
      body: !isMore ? pages[0] : pages[1],
    );
  }
}
