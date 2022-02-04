import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nedium/src/ext/tr.dart';

import 'package:package_info_plus/package_info_plus.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.tr.about),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: LinearProgressIndicator());
              }
              final packageInfo = snapshot.data!;

              return ListTile(
                title: Text(context.tr.currentVersion(packageInfo.version)),
                enabled: false,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(context.tr.openSourceLicenses),
            onTap: () => context.go("/about/licenses"),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: Text(context.tr.sourceCode),
          )
        ],
      ),
    );
  }
}
