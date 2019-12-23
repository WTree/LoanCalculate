import 'package:flutter/material.dart';

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

class _MyLoadPageState extends State<MyLoadPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
              BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Text("one1"),

                    Text("two2")],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


