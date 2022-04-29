import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ui/work2/watermark_stamp/panel_widget.dart';

import 'bottom_navigation.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    bool _visible = true;

    final panelHeightOpen = MediaQuery.of(context).size.height * 0.4;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.0130;

    return Scaffold(
      bottomNavigationBar: const bottomNavigation(),
      backgroundColor: Colors.white,
      body: SlidingUpPanel(
        color: Colors.white70,
        controller: panelController,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        // parallaxEnabled: true,
        //   parallaxOffset: 0.5,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        //body: maps,
        panelBuilder: (controller) => PanelWidget(
          panelController: panelController,
          controller: controller,
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
