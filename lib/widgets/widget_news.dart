import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/newsmodel.dart';
import 'package:flutter_application_1/screans4/article.dart';
import 'package:flutter_application_1/service/newsservice.dart';
import 'package:flutter_application_1/widgets/card.dart';


class WidgetNews extends StatelessWidget {
  const WidgetNews({
    Key? key,
    required this.product,
  }) : super(key: key);

  final newsmodel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10),
      child: GestureDetector(onTap: () {
        Navigator.pushNamed(context, 'article');
      },
        child: GestureDetector(
          onTap: (){
           final Future<List<newsmodel>> listOfNews = newsservice().getnews();
           Navigator.push(context, MaterialPageRoute(builder: (context) {
             return article(
              model: product,
             );
           },));
          },
          child: card(product: product, n: 2,ndesc: 5, ),
        ),
      ),
    );
  }
}

