import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeky_vote/core/ApiService.dart';

import '../core/ApiPath.dart';


//class use for mannage Authetication Data model and handler error
class AuthController with ChangeNotifier{
   bool isAuth = false;
   
   void Register(String fname, String lname,String email, String password, String position) async{
     try{
      final response = await ApiService.postRegis({
        'fname':fname,
        'lname':lname,
        'email': email,
        'password': password,
        'position': position
       });
       final prefs = await SharedPreferences.getInstance();
       prefs.setString('token', json.decode(response.body)['token']);
       if(response.statusCode == 200){
        throw "ບໍ່ໄດ້ປ້ອນລະຫັດຜ່ານ";
       }
     }catch(error){
  
     }
   }

   void SignUp(String email, String password) async{
     try{
      final prefs = await SharedPreferences.getInstance();
      final urlSign = Uri.parse(ApiPath.signIn);
      final response = await http.post(urlSign, headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email':email,
        'password': password
      }));
      prefs.setString('token', jsonDecode(response.body)['token']);
      print(response.body);
      if(response.body != null){
         isAuth = true;
      }else{
         isAuth = false;
      }
      notifyListeners();
     }catch(error){
       throw error;
     }
   }
}