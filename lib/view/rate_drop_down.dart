import 'package:flutter/material.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';

class RateDropDown extends StatefulWidget {

 final SpnnerControl control;


  RateDropDown(this.control);

  _RateDropDownState createState() => _RateDropDownState(control);
}

class _RateDropDownState extends State<RateDropDown> {
  SpnnerControl control;

  _RateDropDownState(this.control);

  List<String> spinnerItems = ["年息", "月息", "日息"];

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
