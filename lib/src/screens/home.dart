import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nedium/src/ext/tr.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent) {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(title: Text(context.tr.appName), floating: true),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go("/suggestions"),
        child: const Icon(Icons.search),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text(context.tr.appName),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(context.tr.editorsPicks),
                    selected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () => context.go("/settings"),
              leading: const Icon(Icons.settings),
              title: Text(context.tr.settings),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(context.tr.about),
              onTap: () => context.go("/about"),
            )
          ],
        ),
      ),
    );
  }
}
