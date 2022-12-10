import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeky_vote/Controller/AuthController.dart';
import 'package:weeky_vote/Controller/PositionController.dart';
import 'package:weeky_vote/Model/PositionModel.dart';
import 'package:weeky_vote/Presentation/Screen/EnterRoomScreen.dart';
import '../widget/BuildForm.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "/registerScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = new GlobalKey<FormState>();
  String _fname = "";
  String _lname = "";
  String _email = "";
  String _password = "";
  String _positioned = "";

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PositionController>(context, listen: false).FetchPosition();
    super.initState();
  }

  void OnSubmit() {
    if (!_formKey.currentState!.validate()) return;
    Provider.of<AuthController>(context, listen: false)
        .Register(_fname, _lname, _email, _password, _positioned);
        Navigator.of(context).pushNamed(EnterRoomScreen.routeName);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/Image/background.jpeg"),
                    fit: BoxFit.cover)),
            child: Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.only(top: 200),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildForm(
                            text: "Firstname",
                            acceptValue: (String value) {
                              _fname = value.trim();
                            },
                            validation: (String? value) {},
                          ),
                          BuildForm(
                            text: "Lastname",
                            acceptValue: (value) {
                              _lname = value.trim();
                            },
                            validation: (value) {},
                          ),
                          BuildForm(
                            text: "Email",
                            acceptValue: (String value) {
                              _email = value.trim();
                            },
                            validation: (String? value) {},
                          ),
                          BuildForm(
                            text: "Password",
                            acceptValue: (value) {
                              _password = value.trim();
                            },
                            validation: (String? value) {},
                          ),
                          BuildForm(
                            text: "Confirm Password",
                            acceptValue: (String value) {},
                            validation: (String? value) {},
                          ),
                          BuildDropDown("Position", context),
                          Container(
                              child: ElevatedButton(
                            child: Text("Sign up"),
                            onPressed: () {
                              OnSubmit();
                            },
                          ))
                        ]),
                  ),
                ))));
  }

  Widget BuildDropDown(String text, BuildContext ctx) {
    return Consumer<PositionController>(
        builder: (context, positionData, child) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: Text(text, style: Theme.of(ctx).textTheme.bodySmall)),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              child: DropdownButton<String>(
                  
                  value: _positioned.isNotEmpty ? _positioned : null,
                  underline: SizedBox(),
                  items: positionData.getListPosition
                      .map((element) => DropdownMenuItem<String>(
                          child: Text(element.psName.toString()),
                          value: element.psId.toString()))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      
                      _positioned = value!.trim();
                    });
                  }),
            ),
          ],
        ),
      );
    });
  }
}
