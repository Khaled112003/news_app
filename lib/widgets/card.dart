import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/newsmodel.dart';

class card extends StatelessWidget {
  const card({
    super.key,
    required this.product, required this.n, required this.ndesc,
  });
  final int n;
   final int ndesc;

  final newsmodel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 234, 237, 246),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  height: 200,
                  child: product.image != null
                      ? Image.network(
                          product.image!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset('assets/A_black_image.jpg.webp'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  product.decs,
                  maxLines: ndesc,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                indent: 30,
                endIndent: 30,
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  product.text,
                  maxLines: n,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}