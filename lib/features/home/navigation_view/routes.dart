import '../succesful_order/succesful_order_view.dart';

import 'destination_model.dart';
import 'root_view.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key, required this.destination}) : super(key: key);
  final Destination destination;
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case "/":
                return RootView(
                  destination: widget.destination,
                );
              case "/orderSuccesful":
                return const SuccesfulOrder();
              default:
                return RootView(
                  destination: widget.destination,
                );
            }
          },
        );
      },
    );
  }
}
