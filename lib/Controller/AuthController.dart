import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AuthController with ChangeNotifier{
   String _urlMain = "";
   void SignUp(String fname, String lname,String email, String password, String position) async{
     try{
       final urlSign = Uri.parse(_urlMain);
       final respone = await http.post(urlSign, headers: {"Content-Type": "application/json"},
       body: jsonEncode({
        'fname':fname,
        'lname':lname,
        'email': email,
        'position': position
       }));
     }catch(error){
      print(error);
     }
   }
}