import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final String trending;

  const TrendingMovies({required Key key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text('Trending Movies')
        ],
      ),
    );
  }
}