import 'package:flutter/material.dart';
import 'package:nedium/src/ext/tr.dart';

class PostVoters extends StatelessWidget {
  final String id;
  const PostVoters(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.tr.voters),
            floating: true,
          ),
        ],
      ),
    );
  }
}
