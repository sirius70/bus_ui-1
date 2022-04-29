import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 80.0,
          leading: ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25.0,
              color: Colors.black,
            ),
            label: const Text(" "),
            style:
                ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
          ),
          elevation: 0,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: const Text(
                  "Create your Account",
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 30.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Email/number", border: InputBorder.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              //RaisedButton(
              //   padding:
              //       EdgeInsets.symmetric(horizontal: 120.0, vertical: 15.0),
              //  onPressed: () {},
              //  shape: RoundedRectangleBorder(
              //    borderRadius: BorderRadius.circular(80.0)),
              // child: Text("Submit"))
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff038c8c), const Color(0xff666dad)],
                  ),
                  // color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RaisedButton(
                  colorBrightness: Brightness.light,
                  onPressed: () {},
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 130.0),
                  color: Colors.transparent,
                  child: const Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
