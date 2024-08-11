import 'package:filmapp_ui/pageview_screen.dart';
import 'package:flutter/material.dart';
import 'moviestypes.dart';
void main() {
  runApp(const Filmappui());
}

class Filmappui extends StatefulWidget {
  const Filmappui({super.key});

  @override
  State<Filmappui> createState() => _FilmappuiState();
}

class _FilmappuiState extends State<Filmappui> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageViewScreen(),
    );
  }
}
