import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_state_management/redux/actions.dart';
import 'redux/app_state.dart';
import 'redux/reducers.dart';

void main() {
  final store = Store<CounterState>(
    counterReducer,
    initialState: CounterState(),
  );

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CounterState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux example',
        home: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Redux example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<CounterState, int>(
              converter: (store) => store.state.count,
              builder: (context, count) => Text(
                count.toString(),
                style: TextStyle(fontSize: 48),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StoreConnector<CounterState, VoidCallback>(
                  converter: (store) => () => store.dispatch(IncrementAction()),
                  builder: (context, callback) => ElevatedButton(
                    onPressed: callback,
                    child: Text('Increment'),
                  ),
                ),
                SizedBox(width: 16),
                StoreConnector<CounterState, VoidCallback>(
                  converter: (store) => () => store.dispatch(DecrementAction()),
                  builder: (context, callback) => ElevatedButton(
                    onPressed: callback,
                    child: Text('Decrement'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
