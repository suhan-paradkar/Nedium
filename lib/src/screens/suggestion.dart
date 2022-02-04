import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nedium/singleton.dart';
import 'package:nedium/src/ext/tr.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  var suggestions = <String>[];
  bool isBusy = false;
  StreamSubscription? sub;

  Future<void> _getSuggestions(String q) async {
    await sub?.cancel();

    setState(() => isBusy = true);

    try {} catch (_) {}
  }

  void _goToResults(String query) => context.go("/search/$query");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          onChanged: _getSuggestions,
          onSubmitted: _goToResults,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "${context.tr.searchHint}...",
          ),
        ),
      ),
      body: Column(
        children: [
          AnimatedOpacity(
            opacity: isBusy ? 1 : 0,
            duration: const Duration(milliseconds: 400),
            child: const LinearProgressIndicator(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                var suggestion = suggestions[index];
                return ListTile(
                  title: Text(suggestion),
                  onTap: () => _goToResults(suggestion),
                );
              },
              itemCount: suggestions.length,
            ),
          ),
        ],
      ),
    );
  }
}
