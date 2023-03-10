import 'package:flutter/material.dart';

import 'state/riverpod/riverpod_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: RiverpodApp()));
}

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RiverpodScreen(),
    );
  }
}
