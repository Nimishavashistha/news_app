import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/Article_model.dart';
import 'package:news_app/model/heading_model.dart';
import 'package:news_app/ui/article_view.dart';
import 'package:news_app/ui/category_views.dart';
import 'package:news_app/ui/data.dart';
import 'package:news_app/ui/news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HeadingModel> categories = new List<HeadingModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "News",
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            Text(
              "World",
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[


                    ///HeadingCategories
                    Container(
                      height: 70,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return HeadingTile(
                              imageUrl: categories[index].imageUrl,
                              HeadingName: categories[index].HeadingName,
                            );
                          }),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Top",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Headlines",
                            style: TextStyle(
                              color: Color(0xff5066c6),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),

                    ///Articles
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: Card(
                        elevation: 0.6,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BlogTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                url: articles[index].url,
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class HeadingTile extends StatelessWidget {
  final imageUrl, HeadingName;

  const HeadingTile({Key key, this.imageUrl, this.HeadingName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>CategoryViews(
            category: HeadingName.toString().toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                width: 120,
                height: 60,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                HeadingName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc,url;

  const BlogTile(
      {Key key,
      @required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(
          blogUrl: url,
        )
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
        child: Card(
          elevation: 2.0,
          child: ListTile(
            leading:CircleAvatar(
              child: Container(
                 width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image:NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.blue,
                   borderRadius: BorderRadius.circular(13.9),
                ),
                child: null,
              ),
            ) ,
            title: Text(title,
            style: TextStyle(
              color: Color(0xff000099),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),),
            subtitle: Text(desc,
                style: TextStyle(
                  color: Color(0xff5066c6),
                ),),
          ),
        ),
      ),
    );
  }
}
