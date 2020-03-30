import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quick_eats/blocs/simple_bloc_delegate.dart';
import 'package:quick_eats/src/app.dart';
import 'package:logging/logging.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  _setupLogging();
  runApp(QuickEats());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
