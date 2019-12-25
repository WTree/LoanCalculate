import 'package:flutter/material.dart';
import 'package:loan_calc/ctrl/SpnnerControl.dart';

class RateMoneyDropDown extends StatefulWidget {

 final SpnnerControl control;


 RateMoneyDropDown(this.control);

 _RateMoneyDropDownState createState() => _RateMoneyDropDownState(control);
}

class _RateMoneyDropDownState extends State<RateMoneyDropDown> {
  SpnnerControl control;

  _RateMoneyDropDownState(this.control);

  List<String> spinnerItems = [  "日息","月息","年息"];

  String dropDownValue;

  @override
  void initState() {
    super.initState();
    dropDownValue = spinnerItems[0];
    control.value=dropDownValue;
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
                control.value=dropDownValue;
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
