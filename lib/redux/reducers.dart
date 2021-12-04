import 'package:workshop_redux_tutorial/redux/actions.dart';
import 'package:workshop_redux_tutorial/redux/store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is UpdateKmCleaned) {
    AppState newState;
    newState = AppState.copyWith(
      prev: prevState,
      km: action.payload,
    );
    return newState;
  } else if (action is UpdateMiles) {
    AppState newState;
    newState = AppState.copyWith(
      prev: prevState,
      miles: action.payload,
    );
    return newState;
  }
  return prevState;
}
