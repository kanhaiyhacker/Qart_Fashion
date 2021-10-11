import 'package:flutter/material.dart';

class CenterCircularLoader extends StatelessWidget {
  const CenterCircularLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
