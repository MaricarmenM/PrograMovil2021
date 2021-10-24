import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica2/src/models/popular_movies_model.dart';

class CardPopularView extends StatelessWidget {

  final PopularMoviesModel popular;


  const CardPopularView({ Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            offset: Offset(0.0,0.5),
            blurRadius: 2.5
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: FadeInImage(
                  placeholder: AssetImage('assets/activity_indicator.gif'),
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/${popular.backdropPath}'),
                  fadeInDuration: Duration(milliseconds: 200),
                ),
              ),
          Opacity(
            opacity: .5,
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              height: 60,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(popular.title!,style: TextStyle(color: Colors.white,fontSize: 12.0),),
                  MaterialButton(
                    child: Icon(Icons.chevron_right, color: Colors.white),
                    onPressed: (){
                      Navigator.pushNamed(
                        context, '/detail',
                          arguments: {
                            'title' : popular.title,
                            'overview':popular.overview,
                            'posterpath': popular.posterPath,
                          }
                      );
                    },
                    )
                ],
              ),
            ),
          ),
        ],
      )
    )
    );
  }
}