import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
        },
        builder: (context, count) {
          if (count.counterValue < 0) {
            return Center(
              child: Text(
                'Negative Value ${count.counterValue}',
                style: const TextStyle(fontSize: 24.0),
              ),
            );
          } else if (count.counterValue % 2 == 0) {
            return Center(
              child: Text(
                'Even Number ${count.counterValue}',
                style: const TextStyle(fontSize: 24.0),
              ),
            );
          }
          return Center(
            child: Text(
              '${count.counterValue}',
              style: const TextStyle(fontSize: 24.0),
            ),
          );
          // child: Text(

          //   '$count',
          //   style: TextStyle(fontSize: 24.0),
          // ),
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterIncrementPressed()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterDecrementPressed()),
            ),
          ),
        ],
      ),
    );
  }
}
