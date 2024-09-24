import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
  LoadingStateWidget({this.loadingMessage,super.key});

  String? loadingMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          Text(loadingMessage??"")
        ],
      ),
    );
  }
}
