import 'package:flutter/material.dart';

class DateDropDown extends StatefulWidget {
  _DateDropDownState createState() => _DateDropDownState();
}

class _DateDropDownState extends State<DateDropDown> {
  List<String> spinnerItems = ["年", "月", "日"];

  String dropDownValue;

  @override
  void initState() {
    super.initState();
    dropDownValue = spinnerItems[0];
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
