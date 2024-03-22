import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custombuttonfield.dart';



class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 90, left: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(clipBehavior: Clip.none, children: [
              Positioned(
                  bottom: 160,
                  left: 180,
                  child: Container(
                      child: Image.asset(
                    "assets/11841.jpg",
                    height: 100,
                  ))),
              Container(
                  child: Image.asset(
                "assets/23415.jpg",
              )),
              Positioned(
                  top: 250,
                  left: 100,
                  child: Container(
                      child: Image.asset(
                    "assets/images.jpg",
                    height: 100,
                  ))),
              Positioned(
                  top: 160,
                  left: 180,
                  child: Container(
                      child: Image.asset(
                    "assets/287900.jpg",
                    height: 100,
                  ))),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: custombuttonfield(
                text: 'Begin',
                onTap: () {
                  Navigator.pushNamed(context,'newspage');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
