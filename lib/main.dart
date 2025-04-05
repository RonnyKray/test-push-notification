import 'dart:async';
import 'package:app/core/runner/runner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await AppRunner().run();
  }, (e, s) {
    print('$e, $s');
  });
}
