import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Player extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlayerState();
  }
}

class PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: ( BuildContext context, AsyncSnapshot snapshot ) {

        return snapshot.connectionState == ConnectionState.waiting 
        ? CircularProgressIndicator()
        : ;

      },
      future: (() async {})(),
      initialData: null,
    )
  }
}
