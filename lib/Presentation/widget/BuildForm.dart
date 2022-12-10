
import 'package:flutter/material.dart';

class BuildForm extends StatelessWidget {
  final String text;
  final Function(String value) acceptValue;
  final String? Function(String? value)? validation;
  BuildForm({required this.text,required this.acceptValue,required this.validation, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                margin: const EdgeInsets.only(left: 10, top: 10),
                child:
                    Text(text, style: Theme.of(context).textTheme.bodySmall)),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: TextFormField(
                validator: validation,
                onChanged: acceptValue,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: InputBorder.none),
              ),
            )
          ])),
    );
  }
}
