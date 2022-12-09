import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "/registerScreen";
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage("asset/Image/background.jpeg"), fit: BoxFit.cover)),
            child: Form(child: Container(
              margin: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  BuildForm("Firstname", context),
                  BuildForm("Lastname", context),
                  BuildForm("Email", context),
                  BuildForm("Password", context)
                ]),
              ),
            ))));
  }

  Widget BuildForm(String text, BuildContext ctx) {
    return SizedBox(
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 10),
          child: Text(text, style: Theme.of(ctx).textTheme.bodySmall)),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(left:10, right: 10, bottom: 10),
          child: TextFormField(
              validator: (value) {
      
          },
          decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          border: InputBorder.none),
          ),
        )
      ])),
    );
  }
}
