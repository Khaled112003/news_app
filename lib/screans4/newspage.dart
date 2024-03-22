
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/newsmodel.dart';
import 'package:flutter_application_1/service/newsservice.dart';
import 'package:flutter_application_1/widgets/widget_news.dart';

class newspage extends StatefulWidget {
  const newspage({super.key});

  @override
  State<newspage> createState() => _newspageState();
}

class _newspageState extends State<newspage> {
   Future<List<newsmodel>>? futur;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futur=newsservice().getnews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 253, 253),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                text: 'NG',
                style: TextStyle(
                    fontSize: 30,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                      text: 'News Edit',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      )),
                ],
              ),
            ),
            FutureBuilder<List<newsmodel>>(
              future: futur,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<newsmodel> articles = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      
                       itemCount: articles.length,
  itemBuilder: (context, index) {
    // التحقق مما إذا كان المؤشر داخل نطاق القائمة
    if (index < articles.length) {
      return WidgetNews(
        product: articles[index],
      );
    } else {
      // التعامل مع الحالة التي تتجاوز فيها المؤشر حدود القائمة
      return SizedBox(); // أو أي عنصر واجهة أخر تريده عرضه
    }
  },
                    ),
                  );
                }else if(snapshot.hasError){
                  throw("there's an error");
                }
                
                
                
                 else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
