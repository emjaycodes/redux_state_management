import 'actions.dart';
import 'app_state.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  if (action is IncrementAction) {
    return state.copyWith(count: state.count + 1);
  } else if (action is DecrementAction) {
    return state.copyWith(count: state.count - 1);
  }

  return state;
}

