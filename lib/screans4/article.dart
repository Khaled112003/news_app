import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/newsmodel.dart';
import 'package:flutter_application_1/widgets/card.dart';





class article extends StatelessWidget {
   article({super.key, required this.model,});
   
   final newsmodel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.download,
            color: Colors.black,
          ),
          Icon(Icons.bookmark)
        ],
      ),
      body:SingleChildScrollView(
        child: Column(children: [
          card(product: model ,n: 50,ndesc: 20,)
        ],),
      ) 
    );
  }
}

