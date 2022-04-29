import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ui/work2/watermark_stamp/bar_chart.dart';
import 'package:ui/work2/watermark_stamp/videoPlayer.dart';

import '../icon_gradient.dart';

class searchDropdownList extends StatefulWidget {
  const searchDropdownList({Key? key}) : super(key: key);

  @override
  State<searchDropdownList> createState() => searchDropdownListState();
}

class searchDropdownListState extends State<searchDropdownList> {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GradientIcon(
            Icons.menu,
            25,
            LinearGradient(
              colors: <Color>[Color(0xff038c8c), Color(0xff666dad)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "Bar Graph Representing Info",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Chart(),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Select a route',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
//fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.grey,
                    iconDisabledColor: Colors.grey,
                    buttonHeight: 50,
                    buttonWidth: 370,
                    buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.grey[200],
                    ),
                    buttonElevation: 2,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 15, right: 15),
                    dropdownMaxHeight: 150,
                    dropdownWidth: 370,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
// offset: const Offset(-20, 0),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "How We Work",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SamplePlayer())
              ],
            ),
          ),
        ));
  }
}
