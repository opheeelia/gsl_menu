import 'package:flutter/material.dart';
import 'package:gsl_menu/services/auth.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [ElevatedButton(onPressed: (){
          _auth.signOut((){});
        }, child: const Text("Logout"))],
      ),
    );
  }
}
