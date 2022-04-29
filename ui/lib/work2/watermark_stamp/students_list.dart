import 'package:flutter/material.dart';

class studentsList extends StatefulWidget {
  const studentsList({Key? key}) : super(key: key);

  @override
  State<studentsList> createState() => _studentsListState();
}

class _studentsListState extends State<studentsList> {
  final allChecked = CheckBoxModal(title: "Select all");
  final checkBoxList = [
    CheckBoxModal(title: "Sheldon, 001"),
    CheckBoxModal(title: "Amy, 002"),
    CheckBoxModal(title: "Leonard, 003"),
    CheckBoxModal(title: "Penny, 004"),
    CheckBoxModal(title: "Bernie, 005"),
    CheckBoxModal(title: "Howard, 006"),
    CheckBoxModal(title: "Rachel, 007"),
    CheckBoxModal(title: "Ross, 008"),
    CheckBoxModal(title: "Chandler, 009"),
    CheckBoxModal(title: "Phoebe, 010"),
    CheckBoxModal(title: "Monica, 011"),
    CheckBoxModal(title: "Joey, 012"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Students list"),
        flexibleSpace: Container(
        decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xff038c8c), Color(0xff666dad)]),
        ),
        ),
      ),

      body: Container(
        child: ListView(
        children: [
          CheckboxListTile(
            title: Text("Select all",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black
            ),),
            controlAffinity: ListTileControlAffinity.platform,
            //secondary:
              value:allChecked.value,
              onChanged: (value){
                onAllClicked(allChecked);
              },
          activeColor: Colors.black,
            checkColor: Colors.white,

          ),


              ...checkBoxList.map((item) =>
                  Container(
                      padding: EdgeInsets.only(bottom: 5, right: 20, left: 20),
                      child: Column(
                          children: [
                  ListTile(
                onTap: (){
                  setState(() {
                    onItemClicked(item);
                  });
                },
                title: Text(item.title,
                  style: TextStyle(
                      fontSize: 15
                  ),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: Colors.grey[200],
                leading: Checkbox(
                    activeColor: Colors.black,
                    checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                    value: item.value,
                    onChanged: (value){
                      onItemClicked(item);
                    }),
              ), ])),
          // SizedBox(height: 10,),
          ).toList(),



        ],
      ),)
    ));
  }

  onAllClicked(CheckBoxModal ckbItem){
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkBoxList.forEach((element)=>
          element.value = newValue
      );
    });
  }

  onItemClicked(CheckBoxModal ckbItem){
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;

      if (!newValue){
        allChecked.value = false;
      }
      else{
        final allListChecked = checkBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}

class CheckBoxModal {
  late String title;
  late bool value;

  CheckBoxModal({required this.title, this.value=false});
}
