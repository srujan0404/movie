import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, 
      primaryColor: Colors.green,)
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '9d8f781ab8c31dc18cdac7c47aa6ec3b';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZDhmNzgxYWI4YzMxZGMxOGNkYWM3YzQ3YWE2ZWMzYiIsInN1YiI6IjY1YjNlZWFhYjMzMTZiMDE0YWEwZGU2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YSveMsq_mGd0P_BZDFYi8LlxU2nKWJ8wl6KHPt6czhk';

  @override 
  void initState() {
    loadmovies();
    super.initState();
  }


  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken), 
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true
    )
    );
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    // print(trendingresult);
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Movie App'),),

    );
  }
}