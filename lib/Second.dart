import 'package:flutter/material.dart';
import 'package:news_api/article_model.dart';

class Second extends StatelessWidget {

  final Article article;
  Second({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white60,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ]),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("ogvjjkvbkjvbdckjvjhbsjcbvjfbdsjfgvsdhfvsdvfsdvfsdvfvsdvfhfvshsjkjsjkjfjfdfjbkjjbvjkvbjfkvbjkfbv",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    ),
                    article.urlToImage !=null?

                    Expanded(
                      child: Container(height: 240,
                        width: double.maxFinite,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(article.urlToImage!,),fit: BoxFit.fill)),
                      ),
                    )
                    :
                    Expanded(
                      child: Container(height: 240,
                        width: double.maxFinite,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://images.indianexpress.com/2022/09/Rohit-Sharma-Virat-Kohli.jpg"),fit: BoxFit.fill)),
                      ),
                    ),


                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(article.description!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      ),
                    ),

                  ],
                ),

              ),
            ),
          )

        ]
      ),
    );
  }
}
