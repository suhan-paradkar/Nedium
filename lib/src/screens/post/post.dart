import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String id;
  const Post(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}
