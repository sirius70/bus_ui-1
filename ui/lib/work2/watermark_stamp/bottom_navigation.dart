import 'package:flutter/material.dart';

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors:[Color(0xff038c8c), Color(0xff666dad)],
            begin: Alignment.topCenter,
            end:Alignment.bottomCenter,
          ),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Colors.transparent,
          elevation: 0,
          child: SizedBox(
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(
                    //padding: EdgeInsets.only(left:10),
                      onPressed: (){

                      },
                      icon: Icon(Icons.home,
                        color: Colors.white,)),

                  IconButton(onPressed: (){},
                      icon: Icon(Icons.notifications_active,
                        color: Colors.white,)),
                ],
              ),
            ),
          ),
        )
    );
  }

}