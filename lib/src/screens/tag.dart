import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String id;

  const Tag(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CircularProgressIndicator());
  }
}
