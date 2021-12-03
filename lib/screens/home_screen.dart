import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:workshop_redux_tutorial/redux/actions.dart';
import 'package:workshop_redux_tutorial/redux/store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (BuildContext context, AppState appState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Km"),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Km",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      StoreProvider.of<AppState>(context).dispatch(
                        UpdateKm(payload: value),
                      );
                    },
                  ),
                ),
                const Divider(),
                const Text("Miles"),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(appState.miles.toString()),
                ),
                const Divider(),
                TextButton(
                  child: const Text("Convert"),
                  onPressed: () {
                    StoreProvider.of<AppState>(context).dispatch(
                      Convert(),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
