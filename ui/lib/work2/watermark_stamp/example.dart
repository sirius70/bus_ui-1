import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ui/work2/watermark_stamp/bottom_navigation.dart';
import 'package:ui/work2/watermark_stamp/parent_profile.dart';
import 'package:ui/work2/watermark_stamp/select_route.dart';
import 'package:ui/work2/watermark_stamp/students_list.dart';
import 'package:ui/work2/watermark_stamp/teacher_profile.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PanelController _pc2 = new PanelController();
  PanelController _pc3 = new PanelController();
  PanelController _pc4 = new PanelController();
  PanelController _pc5 = new PanelController();
  PanelController _pc1 = new PanelController();

  bool _visible1 = true;
  bool _visible2 = true;
  bool _visible3 = true;
  bool _visible4 = true;
  bool _visible5 = true;

  Widget buildDragHandle() {
    return GestureDetector(
      child: Center(
        child: Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      //  onTap: togglePanel,
    );
  }

  // void togglePanel() => _pc3.isPanelOpen
  //     ? _pc3.close() : _pc3.open();

  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.45;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.0140;

    return Scaffold(
      appBar: AppBar(
        title: Text("example"),
      ),
      bottomNavigationBar: bottomNavigation(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => studentsList()));
                },
                child: Text("students list")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => searchDropdownList()));
                },
                child: Text("Route selection")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => parentProfile()));
                },
                child: Text("Parent profile")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => teacherProfile()));
                },
                child: Text("Teacher profile")),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: !_visible3,
              child: SlidingUpPanel(
                maxHeight: panelHeightOpen,
                minHeight: panelHeightClosed,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                color: Colors.white70,
                controller: _pc2,
                panel: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xff038c8c), Color(0xff666dad)],
                    ),
                    shape: BoxShape.rectangle,
                  ),
                  child: SizedBox(
                    height: 10,
                    width: 10,
                    child: ElevatedButton(
                      child: const Text(
                        'Switch',
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        // _pc2.close();
                        // _pc3.close();
                        // _visible3 = true;
                        // if (_visible3 == true){
                        //   _visible1 == true;
                        // }
                        // else{
                        //   _visible1 == false;
                        // }
                        // setState(() {});
                        // _pc1.open();
                        // _pc3.close();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: !_visible1,
              child: SlidingUpPanel(
                maxHeight: panelHeightOpen,
                minHeight: panelHeightClosed,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                color: Colors.white70,
                controller: _pc1,
                panel: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      lists(context),
                    ])),
                collapsed: buildDragHandle(),
              ),
            ),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: _visible2,
              child: SlidingUpPanel(
                maxHeight: panelHeightOpen,
                minHeight: panelHeightClosed,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
                color: Colors.white,
                controller: _pc3,
                panel:
                    //   SingleChildScrollView(child:
                    Container(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bus1",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.all(20),
                      // color: Colors.grey[350],
                      height: 245,
                      width: 500,
                      child: Text(
                        "Bus 1 Info",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              //stops: [0.0, 1.0],
                              colors: [Color(0xff038c8c), Color(0xff666dad)],
                            ),
                            // color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _pc3.close();
                              _visible2 = false;
                              if (_visible2 == false) {
                                _visible1 = false;
                              } else {
                                _visible1 = true;
                              }
                              setState(() {});
                              _pc1.open();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(110, 35)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              // elevation: MaterialStateProperty.all(3),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              'Switch',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ]),
                  // ),
                ),
                collapsed: buildDragHandle(),
              ),
            ),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: !_visible4,
              child: SlidingUpPanel(
                maxHeight: panelHeightOpen,
                minHeight: panelHeightClosed,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                color: Colors.white,
                controller: _pc4,
                panel:
                    //SingleChildScrollView(child:
                    Container(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bus2",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.all(20),
                      // color: Colors.grey[350],
                      height: 245,
                      width: 500,
                      child: Text(
                        "Bus 2 Info",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff038c8c), Color(0xff666dad)],
                            ),
                            // color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _pc4.close();
                              _visible4 = true;
                              if (_visible4 == false) {
                                _visible1 = true;
                              } else {
                                _visible1 = false;
                              }
                              setState(() {});
                              _pc1.open();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(110, 35)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              // elevation: MaterialStateProperty.all(3),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              'Switch',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ]),
                  //    ),
                ),
                collapsed: buildDragHandle(),
              ),
            ),
            Visibility(
              maintainState: true,
              maintainAnimation: true,
              visible: !_visible5,
              child: SlidingUpPanel(
                maxHeight: panelHeightOpen,
                minHeight: panelHeightClosed,
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                controller: _pc5,
                panel:
                    //  SingleChildScrollView(child:
                    Container(
                  padding: EdgeInsets.all(20),
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bus3",
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.all(20),
                      // color: Colors.grey[350],
                      height: 245,
                      width: 500,
                      child: Text(
                        "Bus 3 Info",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 4),
                                  blurRadius: 5.0)
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff038c8c), Color(0xff666dad)],
                            ),
                            // color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _pc5.close();
                              _visible5 = true;
                              if (_visible5 == false) {
                                _visible1 = true;
                              } else {
                                _visible1 = false;
                              }
                              setState(() {});
                              _pc1.open();
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(110, 35)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              // elevation: MaterialStateProperty.all(3),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              'Switch',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                  ]),
                  // ),
                ),
                collapsed: buildDragHandle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lists(context) {
    return SingleChildScrollView(
      child: Container(
          // width: 150,
          //height: 100,
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            //  color: Colors.grey,
          ),
          //color: Colors.grey,

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Bus1"),
                ListTile(
                  onTap: () {
                    _pc1.close();
                    _pc5.close();
                    _pc3.close();
                    _pc4.close();
                    _visible2 = true;
                    if (_visible2 == false) {
                      _visible1 = false;
                    } else {
                      _visible1 = true;
                    }
                    setState(() {});
                    _pc3.open();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.grey[700],
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/09/Luffy-Laughing-in-One-Piece.jpg"),
                    radius: 50,
                  ),
                  title: Text("Driver contact"),
                  subtitle: Text("School info"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Bus2"),
                ListTile(
                  onTap: () {
                    _pc1.close();
                    _pc5.close();
                    _pc3.close();
                    _pc4.close();
                    _visible4 = false;
                    if (_visible4 == false) {
                      _visible1 = true;
                    } else {
                      _visible1 = false;
                    }
                    setState(() {});
                    _pc4.open();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.grey[700],
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i1.sndcdn.com/artworks-HjidtoxmYlSUdHWo-y6zizg-t500x500.jpg"),
                    radius: 50,
                  ),
                  title: Text("Driver contact"),
                  subtitle: Text("School info"),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bus3",
                  textAlign: TextAlign.start,
                ),
                ListTile(
                  onTap: () {
                    _pc1.close();
                    _pc5.close();
                    _pc3.close();
                    _pc4.close();
                    _visible5 = false;
                    if (_visible5 == false) {
                      _visible1 = true;
                    } else {
                      _visible1 = false;
                    }
                    setState(() {});
                    _pc5.open();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.grey[700],
                  selectedTileColor: Colors.white,
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/736x/3a/4c/64/3a4c64b726244d79e8009a30fdd75e3a.jpg"),
                    radius: 50,
                  ),
                  title: Text("Driver contact"),
                  subtitle: Text("School info"),
                ),
              ])),
    );
  }
}
