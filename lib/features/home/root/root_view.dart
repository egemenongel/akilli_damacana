import 'package:akilli_damacana/features/_product/destinations/destination_model.dart';
import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key, required this.destination}) : super(key: key);
  final Destination destination;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: destination.widget,
    );
  }
}
