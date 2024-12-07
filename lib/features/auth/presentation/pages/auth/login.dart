import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  _buildBar() {
    return AppBar(
        title: const Text(
      'Dario',
      style: TextStyle(color: Colors.black),
    ));
  }
}
