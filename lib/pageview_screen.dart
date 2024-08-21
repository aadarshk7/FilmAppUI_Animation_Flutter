import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController pageController = PageController(viewportFraction: 0.75);
  PageController backgroundPageController = PageController();
  int topIndex = 0;
  int currentPage = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size =
        MediaQuery.of(context).size; // Define and assign the 'size' variable
    // var column = Column(
    //         children:[
    //           SizedBox(
    //           height: size.height*0.50,
    //           width: size.width,
    //        child:  PageView.builder(itemBuilder: (context, index){
    //           return Container(
    //             color: Colors.white,
    //           );
    //         }),
    //           ),
    //         ],
    //       );
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("AppUI"),
        // ),
        body: Stack(
      children: [
        PageView.builder(
            controller: backgroundPageController,
            scrollBehavior: ScrollBehavior(),
            scrollDirection: Axis.horizontal,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              return ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(colors: [
                    Colors.white,
                    Colors.transparent,
                  ], begin: Alignment.center, end: Alignment.bottomCenter)
                      .createShader(bounds);
                },
                child: Image.network(
                  moviesList[index].image,
                  fit: BoxFit.cover,
                ),
              );
            }),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: size.height * 0.50,
              width: size.width,
              child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    backgroundPageController.animateToPage(value,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  itemCount: moviesList.length,
                  itemBuilder: (context, topIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: currentPage == topIndex ? 0 : 50),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image:
                                      NetworkImage(moviesList[topIndex].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: size.height * 0.30,
                              width: size.width * 0.70,
                            ),
                            Text(
                              moviesList[topIndex].name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: moviesList[topIndex]
                                  .type
                                  .map((e) => Container(
                                        margin: const EdgeInsets.all(8),
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(e),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //              ElevatedButton(
                                //   onPressed: (){},
                                //   child: const Text("Watch Now"),
                                //   style: ElevatedButton.styleFrom(
                                //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                //     textStyle: const TextStyle(fontSize: 16),
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //   ),
                                // ),
                                // ElevatedButton(
                                //   onPressed: (){},
                                //   child: const Text("Details"),
                                //   style: ElevatedButton.styleFrom(
                                //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                //     textStyle: const TextStyle(fontSize: 16),
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(8),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Watch Now",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
          ],
        ),
      ],
    ));
  }
}

class Movies {
  Movies({required this.name, required this.image, required this.type});
  final String name;
  late final String image;
  late final List<String> type;
}

List<Movies> moviesList = [
  Movies(
      name: 'Marvel The Avengers',
      image:
          'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcSK0mRgxk6RD6AXbkAzpQRs7FCh9J0FiOxC9eIHCqoxAgpBeywiPrFjbAcGKbCaVYkc',
      type: ['English', 'Action']),
  Movies(
      name: 'Avengers The Infinity War',
      image:
          'https://upload.wikimedia.org/wikipedia/en/4/4d/Avengers_Infinity_War_poster.jpg',
      type: ['English', 'Action']),
  Movies(
      name: 'Avengers The Endgame',
      image:
          'https://static.wikia.nocookie.net/international-dubbing/images/e/ee/Marvel_Studios%27_Avengers_Endgame_Poster.jpeg/revision/latest/scale-to-width-down/1000?cb=20200620033200',
      type: ['English', 'Action']),
  Movies(
      name: 'Degree Maila',
      image:
          'https://64.media.tumblr.com/c341b3c67a4a518fe7ceac9ea29c71b9/f21aa767ef33205d-c4/s1280x1920/53cefdf5f5c7d05718c7d0bbd55c85f3dc7b110e.jpg',
      type: ['Nepali', 'Comedy']),
  Movies(
      name: 'Aadarsh Kunwar',
      image:
          'https://raw.githubusercontent.com/aadarshk7/Login-App_Google_Facebook_Twitter_Login/master/coat6v2%20(1).jpg',
      type: ['Nepali', 'Biography']),
];
