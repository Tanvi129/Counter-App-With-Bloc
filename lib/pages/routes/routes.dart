import 'package:counter_app_bloc/bloc/counter_bloc.dart';
import 'package:counter_app_bloc/pages/second_screen.dart';
import 'package:counter_app_bloc/pages/third_screen.dart';
import 'package:counter_app_bloc/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterBloc _counterBloc = CounterBloc();

  Route onGenerateRoute(RouteSettings routeSettings) {
    //final GlobalKey<ScaffoldState> key = routeSettings.arguments;
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: CounterPage(),
          ),
        );
      case "/second":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: SecondScreen(),
          ),
        );
      case "/third":
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: ThirdScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: CounterPage(),
          ),
        );
    }
  }

  void dispose(){
    _counterBloc.close();
  }
}
