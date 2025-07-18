import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Center(
            child: SpinKitFadingCircle(
      color: Colors.black26,
      size: 50.0,
    )));
  }
}
