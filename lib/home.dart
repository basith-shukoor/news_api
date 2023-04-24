import 'package:flutter/material.dart';
import 'package:news_api/Second.dart';
import 'package:news_api/api_service.dart';
import 'package:news_api/article_model.dart';


class Newsapi extends StatefulWidget {
  const Newsapi({Key? key}) : super(key: key);

  @override
  State<Newsapi> createState() => _NewsapiState();
}

class _NewsapiState extends State<Newsapi> {
  List im=["https://images.indianexpress.com/2022/09/Rohit-Sharma-Virat-Kohli.jpg"];

  ApiService client=ApiService();
  @override

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,toolbarHeight: 10,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(style:TextStyle(color: Colors.black) ,cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30.0),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search_rounded,color: Colors.black,),
                  label: Text("Search ",style: TextStyle(color: Colors.black),),
                  suffixIcon: Icon(Icons.mic,color: Colors.black,),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ]),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Kozhikode",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Haze.0%",style: TextStyle(fontWeight: FontWeight.w300),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("88°F",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ),


                  ],
                ),
              ),
            ),

            FutureBuilder<List<Article>>(
              future: client.getArticle(),
              builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
                if(snapshot.hasData){


    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount:snapshot.data?.length ,
    itemBuilder: ( context, index) {
    var articles = snapshot.data![index];
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Second(article: articles,)),
    );
    },

    child: Container(
    height: 250,
    // width: double.maxFinite,
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

    Expanded(
    child: Container(
    height: 200,
    width: double.maxFinite,
    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(snapshot.data![index].urlToImage.toString()),fit: BoxFit.fill)),
    ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(snapshot.data![index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
    ),

    ],
    ),

    ),
    ),
    );

    /*Expanded(
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

                              Expanded(
                                child: Container(height: 240,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://images.indianexpress.com/2022/09/Rohit-Sharma-Virat-Kohli.jpg",),fit: BoxFit.fill)),
                                ),
                              ),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("There was a Rohit camp and a Virat camp: R Sridhar reveals how Ravi Shastri intervened to resolve the issueThere was a Rohit camp and a Virat camp: R Sridhar reveals how Ravi Shastri intervened to resolve the issueR Sridhar reveals how Ravi Shastri intervened to resolve the issueR Sridhar reveals how Ravi Shastri intervened to resolve the issueR Sridhar reveals how Ravi Shastri intervened to resolve the issue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                ),
                              ),

                            ],
                          ),

                        ),
                      ),
                    );

*/
    },
    );

    }
              else
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }

            ),


          ],
        ),
      ),



    );
  }
}
