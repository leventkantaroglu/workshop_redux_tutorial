import 'package:workshop_redux_tutorial/redux/actions.dart';
import 'package:workshop_redux_tutorial/redux/store.dart';

AppState reducers(AppState prevState, dynamic action) {
  AppState newState;

  if (action is UpdateKm) {
    newState = AppState.copyWith(prev: prevState, km: action.payload);
    return newState;
  } else if (action is Convert) {
    double kmAsDouble = double.parse(prevState.km != "" ? prevState.km! : "0");
    double milesAsDouble = kmAsDouble * 0.621371;
    newState = AppState.copyWith(
      prev: prevState,
      miles: milesAsDouble.toString(),
    );
    return newState;
  }
  return prevState;
}
