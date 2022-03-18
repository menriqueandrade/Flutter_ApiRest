// To parse this JSON data, do
//
//     final Users = UsersFromMap(jsonString);

// ignore_for_file: file_names


import 'package:http/http.dart' as http;
import 'dart:convert';

class Users {
  Users({
    required this.name,
    required this.username,
    required this.email,
  });

  String name;
  String username;
  String email;

  //factory Users.fromJson(String str) => Users.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        username: json["username"],
        email: json["email"],
      );

  /* Map<String, dynamic> toMap() => {
        "name": name,
        "username": username,
        "email": email,
      };*/
}

Future<Users> getUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );
  if (response.statusCode==200) {
    return Users.fromJson(json.decode(response.body)[0]);
  
  }else{
    throw Exception(
      'Fallo la carga'
    );
  }
}
 