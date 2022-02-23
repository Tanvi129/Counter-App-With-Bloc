import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        
        builder: (context, count) {
           
            if(count<0){
              return Center(
                child: Text(
                
                'Negative Vale $count',
                style: TextStyle(fontSize: 24.0),
            ),
              );
            }else if(count%2==0){
              return Center(
              child: Text(
                
                'Even Number $count',
                style: TextStyle(fontSize: 24.0),
              ),
            );

            }
            return Center(
              child: Text(
                
                '$count',
                style: TextStyle(fontSize: 24.0),
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
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => context.read<CounterBloc>().add(CounterIncrementPressed()),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () => context.read<CounterBloc>().add(CounterDecrementPressed()),
            ),
          ),
        ],
      ),
    );
  }
}
