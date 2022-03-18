// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'models/Users_Api_Model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //2:
  late Future<Users> users;
  //3:
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users= getUsers();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Usuarios'),
        ),
        body: Center(
          child: Container(
            //4:
            child: FutureBuilder<Users>(
              future: users,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget> [
                      Text(snapshot.data!.name),
                      Text(snapshot.data!.email),
                      Text(snapshot.data!.username),
                    ],

                  );
                } else if (snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                else {
                  return CircularProgressIndicator();
                }
              }
          ),
        ),
      ),
      ),
    );
  }
}