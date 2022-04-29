import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  final PanelController? pc1;

  const PanelWidget({
    Key? key,
    required this.controller,
    required this.panelController,
    this.pc1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(top: 10, bottom: 5, right: 20, left: 20),


      child: ListView(
        controller: controller,
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 3,),
          buildDragHandle(),
          SizedBox(height: 36,),

          lists(context),
        ],
      ),
    );
  }

  Widget lists(context){
    return SingleChildScrollView(
      child:Container(
        // width: 150,
        //height: 100,
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            //  color: Colors.grey,
          ),
          //color: Colors.grey,

          child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Bus1"),
                ListTile(
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor:  Colors.grey[700] ,

                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/09/Luffy-Laughing-in-One-Piece.jpg"),
                    radius: 50,
                  ),
                  title: Text("Driver contact"),
                  subtitle: Text("School info"),
                ),

                SizedBox(height: 10,),
                Text("Bus2"),
                ListTile(
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor:  Colors.grey[700] ,

                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://i1.sndcdn.com/artworks-HjidtoxmYlSUdHWo-y6zizg-t500x500.jpg"),
                    radius: 50,
                  ),
                  title: Text("Driver contact"),
                  subtitle: Text("School info"),
                ),

                SizedBox(height: 10,),
                Text("Bus3", textAlign: TextAlign.start,),
                ListTile(
                  onTap: (){
                   // Navigator.pushNamed(context, "/");
                   //  Navigator.push(context,
                   //      new MaterialPageRoute(builder: (context) =>
                   //      bus3()));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => bus3()));
                  },
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor:  Colors.grey[700] ,
                  selectedTileColor: Colors.white,

                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://i.pinimg.com/736x/3a/4c/64/3a4c64b726244d79e8009a30fdd75e3a.jpg"),
                    radius: 50,
                  ),
                  title: Text("Driver contact"),
                  subtitle: Text("School info"),
                ),

              ]
          )
      ), );


  }




  Widget buildDragHandle(){
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
      onTap: togglePanel,
    );
  }

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close() : panelController.open();


}
