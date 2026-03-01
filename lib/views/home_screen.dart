import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white,),
        title: Text('Home Screen', style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold
        ),),
        actions: [Icon(Icons.search, color: Colors.white,)],
      ),
    );
  }
}
