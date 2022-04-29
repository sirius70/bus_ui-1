import 'package:flutter/material.dart';
import 'package:ui/features/icon_gradient.dart';
import 'package:ui/features/tracker.dart';
import 'package:ui/features/video%20player/video.dart';
import 'package:ui/screens/drawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ui/screens/barchart/chart.dart';
import 'package:ui/screens/barchart/home.dart';
import 'notifications.dart';

class Info extends StatefulWidget {
  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final List<Studentstats> data = [
    Studentstats(
      info: "Attendance",
      measure: 50,
      barColor: charts.ColorUtil.fromDartColor(const Color(0xff666dad)),
    ),
    Studentstats(
      info: "Total Distance",
      measure: 70,
      barColor: charts.ColorUtil.fromDartColor(const Color(0xff666dad)),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: Colors.blue.withOpacity(0.4)),
        child: Row(children: [
          const SizedBox(width: 80),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              )),
          const SizedBox(width: 100),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Noti();
                }));
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          const SizedBox(width: 10),
        ]),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
          Row(
            children: [
              Container(
                child: GestureDetector(
                  child: GradientIcon(
                      Icons.sort,
                      30.0,
                      const LinearGradient(
                          colors: [Color(0xff038c8c), Color(0xff666dad)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return navigationDrawer();
                    }));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Bar graph representing Info"),
          ),
          SizedBox(child: StudentChart(data: data)),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Kids Info and Their Route",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: ListTile(
              leading: Container(
                  height: 50,
                  width: 230,
                  child: const Center(child: Text("Aliza")),
                  decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)))),
              trailing: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Tracker();
                  }));
                },
                child: const Text(
                  "SHOW ROUTE",
                  style: const TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple.shade300)),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Container(
                  height: 50,
                  width: 230,
                  child: const Center(child: Text("Aliza")),
                  decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)))),
              trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  "SHOW ROUTE",
                  style: const TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple.shade300)),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Container(
                  height: 50,
                  width: 230,
                  child: const Center(child: Text("Aliza")),
                  decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)))),
              trailing: TextButton(
                onPressed: () {},
                child: const Text(
                  "SHOW ROUTE",
                  style: const TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 8)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.purple.shade300)),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "How we work",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SamplePlayer()
        ]),
      ),
    );
  }
}
