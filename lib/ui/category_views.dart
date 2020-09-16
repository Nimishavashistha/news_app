import 'package:flutter/material.dart';
import 'package:news_app/model/Article_model.dart';
import 'package:news_app/ui/article_view.dart';
import 'package:news_app/ui/news.dart';
class CategoryViews extends StatefulWidget {
  final String category;
  const CategoryViews({Key key, this.category}) : super(key: key);

  @override
  _CategoryViewsState createState() => _CategoryViewsState();


}

class _CategoryViewsState extends State<CategoryViews> {
  List<ArticleModel> articles=new List<ArticleModel>();
  bool _loading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryViewsClass newsClass = CategoryViewsClass();
    await newsClass.getNews(widget.category);
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
                color: Colors.black,
              ),
            ),
            Text(
              "World",
              style: TextStyle(
                color: Colors.red,
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
      :SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 16),
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
              )
            ],
          ),
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
