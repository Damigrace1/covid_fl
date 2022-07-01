import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp( MyApp3());
}
class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskCompletionStatusScreen(),
    );
  }
}

class TaskCompletionStatusScreen extends StatefulWidget {
  const TaskCompletionStatusScreen({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
Future<dynamic>assignTask(Map<String,dynamic> body)async{
  http.Response _response=await http.post(
      Uri.parse('https://www.keepconnected.duckdns.org/task/tasks/tasklist.php'),
      body:body);
  var value= jsonDecode(_response.body);
  Map bodyResponse=value['data'][0];
  print(bodyResponse['title']);
  return value;
}

class TaskStatus{
  static taskCompleted(){
    return Text('Completed',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700),);}
  static taskPending(){
    return Text('Pending',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w700),);
  }
}
class _MyAppState extends State<TaskCompletionStatusScreen> {
   @override
  void initState() {
    super.initState();
    assignTask({
      'userId':'12',
      'type':'2'
    });
  }
  @override
  Widget build(BuildContext context) {
    int  counter=2;
    String title='Title will appear here';
    String subtitle='29-07-2022';
    bool isTaskCompleted=false;
    Text status=isTaskCompleted?TaskStatus.taskCompleted():TaskStatus.taskPending();
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -10,
          backgroundColor: Colors.teal,
          elevation: 0,
          title: Text('Task'),
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { },),),
        backgroundColor: Colors.teal,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            Text('Total : $counter',style: TextStyle(color: Colors.white),),
            SizedBox(height: 40,),
            ListTile(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              tileColor: Colors.white,
              title: Text(title),
              trailing:status ,
              subtitle: Text(subtitle),
            ),
              SizedBox(height: 30,),
            ListTile(
              shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              tileColor: Colors.white,
              title: Text(title),
              trailing:TaskStatus.taskCompleted() ,/* The value of this property will be set "status" later,
                                                   the current value is simply a temporary placeholder to show "completed"
                                                   in UI.*/
              subtitle: Text(subtitle),            )
          ],)),
        ));}}
