import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String? id;
  final String? username;

  const User({this.id, this.username, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()));
  }
}
