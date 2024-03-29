import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({Key? key, required this.errorMessage}) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
