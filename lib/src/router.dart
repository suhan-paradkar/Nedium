import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nedium/src/screens/nedium/about.dart';
import 'package:nedium/src/screens/home.dart';
import 'package:nedium/src/screens/post/post.dart';
import 'package:nedium/src/screens/post/comments.dart';
import 'package:nedium/src/screens/post/voters.dart';
import 'package:nedium/src/screens/search.dart';
import 'package:nedium/src/screens/suggestion.dart';
import 'package:nedium/src/screens/user.dart';

import 'screens/nedium/settings.dart';
import 'screens/tag.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: "about",
          builder: (context, state) => const About(),
          routes: [
            GoRoute(
                path: "licenses",
                builder: (context, state) => const LicensePage()),
          ],
        ),
        GoRoute(
            path: "settings", builder: (context, state) => const Settings()),
        GoRoute(
          path: 'post/:id',
          routes: [
            GoRoute(
              path: "comments",
              builder: (context, state) => PostComments(state.params["id"]!),
            ),
            GoRoute(
              path: "voters",
              builder: (context, state) => PostVoters(state.params["id"]!),
            )
          ],
          builder: (context, state) {
            return Post(state.params["id"]!);
          },
        ),
        GoRoute(
          path: "user/:id",
          builder: (context, state) {
            return User(
              id: state.params["id"],
            );
          },
        ),
        GoRoute(
          path: "search/:query",
          builder: (context, state) {
            return Search(state.params["query"]!);
          },
        ),
        GoRoute(
          path: "tag/:id",
          builder: (context, state) => Tag(state.params["id"]!),
        ),
        GoRoute(
          path: "suggestions",
          builder: (context, state) => const Suggestions(),
        ),
      ],
    ),
  ],
);
