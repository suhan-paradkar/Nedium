import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final String query;
  const Search(this.query, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: "posts"),
              Tab(text: "users"),
              Tab(text: "publications"),
              Tab(text: "tags"),
            ],
          ),
        ),
        body: TabBarView(
          children: [],
        ),
      ),
    );
  }
}
