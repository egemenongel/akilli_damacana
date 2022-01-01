import 'package:akilli_damacana/features/_product/destinations/destination_model.dart';
import 'package:akilli_damacana/features/home/root/root_view.dart';
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