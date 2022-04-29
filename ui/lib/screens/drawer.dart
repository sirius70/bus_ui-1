import 'package:flutter/material.dart';

class navigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 70),
        child: Drawer(
            backgroundColor: Colors.blue,
            child: Column(children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          //padding: EdgeInsets.zero,
                          children: <Widget>[
                    // createDrawerHeader(),
                    createDrawerBodyItem(
                        icon: Icons.account_circle,
                        text: 'My Profile',
                        onTap: () {}),
                    createDrawerBodyItem(
                        icon: Icons.web_asset, text: 'Dashboard', onTap: () {}),
                    createDrawerBodyItem(
                        icon: Icons.info, text: 'About us', onTap: () {}),
                    createDrawerBodyItem(
                        icon: Icons.help, text: 'Help', onTap: () {}),
                    createDrawerBodyItem(
                        icon: Icons.logout, text: 'Log out', onTap: () {})
                  ])))
            ])),
      ),
    );
  }

  Widget createDrawerHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: Color.fromRGBO(203, 182, 130, 1.0),
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/logo_no_back.png')
                    as ImageProvider)),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold))),
        ]));
  }

  Widget createDrawerBodyItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                )),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
