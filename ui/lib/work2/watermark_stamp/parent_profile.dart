import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class parentProfile extends StatelessWidget {
  const parentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Profile"),
        elevation: 0,
      // backgroundColor: Color(0xff555555),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: <Color>[Color(0xff666dad), Color(0xff038c8c), ]),
          ),
        ),
      ),
      body: SingleChildScrollView(child: Stack(
        // alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),


             Padding(
          padding: EdgeInsets.all(100),
             child:  Container(
               width: MediaQuery.of(context).size.width/2,
               height: MediaQuery.of(context).size.width/2,
               decoration: const BoxDecoration(
                 //border: Border.all(color: Colors.white,),
                 shape: BoxShape.circle,
                 color: Colors.white,
                 image: DecorationImage(
                   fit: BoxFit.cover,
                   image:  AssetImage("assets/images/image1.jpg"),
                 ),
               ),
             ),
             ),




           Container(
             padding: EdgeInsets.only(top: 175, left: 170),
            child:
            //CircleAvatar(
             // backgroundColor: Colors.grey[400],
             // child:
               IconButton(
              onPressed: (){},
                  icon: const Icon(Icons.camera_alt_outlined,
                    color: Color.fromRGBO(255, 255, 255, 0.4),)),
         //   ),
          ),

          SizedBox(height: 20,),
          Container(

            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 300, ),
          child: Text("Name of the parent", textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),),),

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 325),
            child: Text("id: 124578",
              style: TextStyle(
                  fontSize: 14,
              ),),),

          SizedBox(height: 100,),

          Container (

            padding: EdgeInsets.only(top: 350, right: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    //leading: Icon(Icons.email),
                    title: Text("Email"),
                    subtitle: Text("mikey@gmail.com"),

                  ),
                  Divider(height: 0,),

                  ListTile(
                    //leading: Icon(Icons.email),
                    title: Text("Phone no."),
                    subtitle: Text("9644528322"),
                  ),
                  Divider(height: 0,),
                  SizedBox(height: 20,),

                  Text("Info of your kids",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.all(20),
                    // color: Colors.grey[350],
                    height: 150,
                    width: 500,
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Student name", textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),),

                        SizedBox(height: 10,),
                        Text("School name, number, address", textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 13,
                            backgroundColor: Colors.grey
                          ),),

                        SizedBox(height: 10,),
                        Text("Bus number", textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 13,
                              backgroundColor: Colors.grey
                          ),),


                        SizedBox(height: 10,),
                        Text("..................", textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 13,
                              backgroundColor: Colors.grey
                          ),),
                      ],
                    )

                  ),
                  SizedBox(height: 20,),

                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(20),
                      // color: Colors.grey[350],
                      height: 150,
                      width: 500,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Student name", textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),),

                          SizedBox(height: 10,),
                          Text("School name, number, address", textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 13,
                                backgroundColor: Colors.grey
                            ),),

                          SizedBox(height: 10,),
                          Text("Bus number", textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 13,
                                backgroundColor: Colors.grey
                            ),),


                          SizedBox(height: 10,),
                          Text("..................", textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 13,
                                backgroundColor: Colors.grey
                            ),),





                        ],
                      )

                  ),
                  SizedBox(height: 10,),

                ]
            ),
            // ),
          ),


        ],
      ),),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size){
    var rect = Offset.zero & size;
    Paint paint = Paint();
    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.topLeft,

      colors: [Color(0xff666dad), Color(0xff038c8c), ]
    ).createShader(rect);
    Path path = Path()
    ..relativeLineTo(0, 150)
    ..quadraticBezierTo(size.width/2, 255, size.width, 150)
    ..relativeLineTo(0, -150)
    ..close();

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}
