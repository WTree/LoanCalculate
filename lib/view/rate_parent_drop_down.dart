import 'package:flutter/material.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';

class RateDropDownParent extends StatefulWidget {

 final SpnnerControl control;


 RateDropDownParent(this.control);

 _RateDropDownParentState createState() => _RateDropDownParentState(control);
}

class _RateDropDownParentState extends State<RateDropDownParent> {
  SpnnerControl control;

  _RateDropDownParentState(this.control);

  List<String> spinnerItems = ["先息后金", "等额本息"];

  String dropDownValue;

  @override
  void initState() {
    super.initState();
    dropDownValue = spinnerItems[0];
    control.textValue=dropDownValue;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(

      child: Column(
        children: <Widget>[
          DropdownButton<String>(
            value: dropDownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.black45, fontSize: 18),
            underline: Container(
              height: 0,
            ),
            onChanged: (String data) {
              setState(() {
                dropDownValue = data;
                control.changeValue=dropDownValue;

              });
            },
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(

                  value: value, child: Text(value),

              );

            }).toList(),
          ),
        ],
      ),
    );

  }
}
