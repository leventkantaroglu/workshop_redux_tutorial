import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/middleware.dart';
import 'redux/reducers.dart';
import 'redux/store.dart';
import 'screens/home_screen.dart';

void main() {
  Store<AppState> _store = Store<AppState>(
    reducers,
    initialState: AppState.initial(),
    middleware: [
      appStateMiddleware,
    ],
  );
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({required this.store, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
