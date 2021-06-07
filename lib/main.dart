import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var favoriteStar = false;
  var favoriteHeart = false;
  var btnPlay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF3AA575), Color(0xFF4CD4A0)])),
        ),
        elevation: 0.0,
        title: Text('Now Playing'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(
            onPressed: () {
              setState(() {
                if (favoriteStar) {
                  favoriteStar = false;
                } else {
                  favoriteStar = true;
                }
              });
            },
            icon: Icon(favoriteStar ? Icons.star : Icons.star_border),
          )
        ],
      ),
      body: (Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF3AA575), Color(0xFF4CD4A0)])),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Song().albumCover,
                    )
                  ],
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Song().title,
                            style:
                                TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                          IconButton(
                              icon: Icon(
                                  favoriteHeart
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  if (favoriteHeart) {
                                    favoriteHeart = false;
                                  } else {
                                    favoriteHeart = true;
                                  }
                                });
                              })
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            Song().singerName,
                            style: TextStyle(
                                color: Color(0xFF16CFDE), fontSize: 16.0),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF25D0DE),
                          ),
                          value: .4,
                          minHeight: 10.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '1:24',
                              style: TextStyle(color: Colors.black38),
                            ),
                            Text(
                              '1:48',
                              style: TextStyle(color: Colors.black38),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon:Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
                            onPressed: (){}),
                          IconButton(
                              iconSize: 70.0,
                              icon:Icon(btnPlay ? Icons.play_arrow_rounded : Icons.stop,color: Colors.white,),
                              onPressed: (){
                                setState(() {
                                  if(btnPlay){
                                    btnPlay = false;
                                  }
                                  else{
                                    btnPlay = true;
                                  }
                                });
                              }),
                          IconButton(
                              icon:Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                              onPressed: (){})
                        ],
                      ),
                      SizedBox(height: 50.0,)
                    ],
                  ),
                ))
              ],
            )),
      )),
    );
  }
}

class Song {
  String title = 'Wish';
  String singerName = 'BlackBeans';
  Image albumCover = Image.network(
    'https://images.freeimages.com/images/large-previews/a83/making-a-wish-1479437.jpg',
    fit: BoxFit.cover,
    width: 300,
  );
}
