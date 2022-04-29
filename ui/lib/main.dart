import 'package:flutter/material.dart';
import 'package:ui/screens/Info.dart';
import 'package:ui/screens/drawer.dart';
import 'package:ui/screens/signup.dart';
import 'work2/watermark_stamp/example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maps',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      routes: {
        "Sign up": (context) => const Signup(),
        "Info": (context) => Info(),
        "drawer": (context) => navigationDrawer(),
        "Work2": (context) => MyApp()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            RouteButton(title: 'Sign up', routeName: 'Sign up'),
            RouteButton(title: 'Info', routeName: 'Info'),
            RouteButton(title: 'Drawer', routeName: 'drawer'),
            RouteButton(title: 'Work2', routeName: 'Work2')
          ],
        ),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  const RouteButton({Key? key, required this.title, required this.routeName})
      : super(key: key);

  final String title;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () => Navigator.pushNamed(context, routeName),
        child: Text(title),
        textColor: Colors.white,
        color: Colors.green[600]);
  }
}
