import 'package:flutter/material.dart';
import 'package:nedium/l10n/languages.dart';
import 'package:nedium/src/ext/tr.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(context.tr.settings),
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            ListTile(
              title: Text(context.tr.language),
              subtitle: Text(context.tr.languageName),
              onTap: () {
                const codes = AppLocalizations.supportedLocales;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    content: SizedBox(
                      width: 100,
                      height: 200,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final code = codes[index];
                          return ListTile(
                            title: Text(
                                languages[code.toLanguageTag()].toString()),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          );
                        },
                        itemCount: codes.length,
                      ),
                    ),
                  ),
                );
              },
            )
          ])),
        ],
      ),
    );
  }
}
