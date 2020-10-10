import 'package:flutter/material.dart';

class CustomTextField {
  final String title;
  final String placeholder;
  final bool ispass;
  final int line;
  String initialValue;
  String err;
  String _value="";
  CustomTextField({this.title="", this.placeholder="", this.ispass=false, this.err="please complete", this.line=1, this.initialValue});
  TextEditingController controller = new TextEditingController();
  
  TextFormField textfrofield(){
    controller.text = initialValue;
    return TextFormField(
      controller: controller,
      maxLines: this.line,
      onChanged: (e){
        _value = e;
      },
      validator: (e)=>e.isEmpty?this.err:null,
      obscureText: this.ispass,
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
        labelStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent
          )
        )
      ),
    );
  }

  String get value{
    return _value;
  }
}