import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp2());
}
class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserViewOnlyScreen(),
    );
  }
}

class UserViewOnlyScreen extends StatefulWidget {
  const UserViewOnlyScreen({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<UserViewOnlyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -10,
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Text('Task XYZ'),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { },),),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35,left: 15,right: 15),
              child: NewWidget(text: 'Title', height: 35, maxLines: 1, initialValue: 'Default Title',),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
              child: NewWidget(text: 'Due Date', height: 35, maxLines: 1, initialValue: 'Default Due Date',),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
              child: NewWidget(text: 'Assigned By', height: 35, maxLines: 1, initialValue: 'Default Assigner',),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
                child: NewWidget(text: 'Description', height: 145, maxLines: 7, initialValue: 'Default Description',)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 15),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.zero,
                child: TextButton(child: Text('Mark as Complete',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onPressed: ()async {},),
              ),
            )
          ],

        ),
      ),
    )
    ;
  }
}

class NewWidget extends StatelessWidget {
  String text;
  String initialValue;
  double height;
  int maxLines;
  NewWidget({required this.initialValue,required this.height,required this.text,required this.maxLines});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style:TextStyle(color: Colors.white,fontSize: 12)),
        SizedBox(height: 10,),
        Container(width: double.infinity,height: height,color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none
              ),
              initialValue: initialValue,
              readOnly: true,
              style: TextStyle(fontStyle: FontStyle.italic),
              maxLines: maxLines,
            ),
          ),
        )
      ],
    );
  }
}
