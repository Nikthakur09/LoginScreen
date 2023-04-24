// ignore_for_file: dead_code

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../src/validatermixin/validater_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40.0),
      child: Form(
        key: formKey,
        child: Column(children: [
          Email(),
          Password(),
          SizedBox(
            height: 100,
          ),
          Submit(),
        ]),
      ),
    );
  }

  String email = '';
  String password = '';

  Widget Email() {
    return TextFormField(
      // Lets ctreate a function which is called by submit using instance of formState

      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email address',
        hintText: 'nikhil@domain.com',
      ),
      validator: (value) {
        if (value!.contains('@')) {
          return null;
        }
        return 'Please Enter a Valid Email';
      },
      onSaved: (value) {
        print(value);
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget Password() {
    return TextFormField(
      obscureText: true, // Dots for passworrd entering
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Should include special characters',
      ),
      validator: (value) {
        if (value!.length < 8) {
          return 'Password should be more than 8 characters';
        }
        password = value;
      },
      onSaved: (value) {
        print(value);
      },
    );
  }

  Widget Submit() {
    return Center(
      child: FloatingActionButton(
        child: Text('Submit'),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            return formKey.currentState?.save();
            print('Now you Can Host data to the server');
          }
        },
      ),
    );
  }
}
