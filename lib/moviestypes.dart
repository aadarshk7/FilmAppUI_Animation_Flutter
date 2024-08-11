import 'package:flutter/material.dart';

class Movies extends StatelessWidget {
  final String name;
  final String image;
  final List<String> type;
  const Movies(
      {super.key, required this.name, required this.image, required this.type});

  @override
  Widget build(BuildContext context) {
    List<Movies> moviesList = [
      const Movies(
          name: 'Ma yesto geet gaunchu',
          image:
              'https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2020/lifestyle/ma-yesto-geet-Gauchu-nepali-movie.jpg&w=900&height=601',
          type: ['Nepali', 'LoveStory']),
      const Movies(
          name: 'Aadarsh Kunwar',
          image:
              'https://raw.githubusercontent.com/aadarshk7/Login-App_Google_Facebook_Twitter_Login/master/coat6v2%20(1).jpg',
          type: ['Nepali', 'Biography']),
      const Movies(
          name: 'Preemgeet 3',
          image:
              'https://web.nepalnews.com/storage/story/1024/viber_image_2022_08_01_11_33_40_3711659333951_1024.jpg',
          type: ['Nepali', 'Action']),
    ];
    return const Scaffold(
        // body: List<Movies(name: name, image: image, type: type),
        );
  }
}
