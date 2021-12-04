import 'package:redux/redux.dart';
import 'package:workshop_redux_tutorial/redux/store.dart';

import 'actions.dart';

bool isNumeric(String? c) {
  if (c == null) {
    return false;
  }
  return double.tryParse(c) != null;
}

void appStateMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is UpdateKm) {
    String cleanedString = '';
    for (String c in action.payload.split('')) {
      if (isNumeric(c)) {
        cleanedString += c;
      }
    }
    store.dispatch(
      UpdateKmCleaned(
        payload: cleanedString,
      ),
    );
  } else if (action is Convert) {
    double kmAsDouble =
        double.parse(store.state.km != "" ? store.state.km! : "0");
    double milesAsDouble = kmAsDouble * 0.621371;
    store.dispatch(
      UpdateMiles(
        payload: milesAsDouble.toString(),
      ),
    );
  }

  next(action);
}
