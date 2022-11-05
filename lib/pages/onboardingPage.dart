import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanyang_marche/pages/loginPage2.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: OnBoard()),
      ),
    );
  }
}

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),

              fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                  height: height*0.2,
                  width: width*0.4,
                  image: const AssetImage('assets/images/marche.png')),
              SliderDisplay(),
              ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                    overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(color: Colors.black, width: 2,),
                    ),),
                  ),
                  child: const Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                      )
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
              ),
              const SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}

class SliderDisplay extends StatefulWidget {
  const SliderDisplay({super.key});

  @override
  State<SliderDisplay> createState() => _SliderDisplayState();
}
class _SliderDisplayState extends State<SliderDisplay> {
  List itemText = ['Welcome to Nanyang Marche!', 'We sell many items',
    'To begin, click on the \n"Get Started" button below'];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                    items: [
                      for (int i = 0; i < itemText.length; i++)
                        Column(
                          children: [
                            Text(
                              itemText[i],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,),
                            ),
                            const SizedBox(height: 10,),
                            Expanded(child: Image(image: AssetImage('assets/images/slider$i.png'))),
                          ],
                        )
                    ],
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        autoPlay: true),
                  ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < itemText.length; i++)
                      Container(
                        height: 13,
                        width: 13,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: currentIndex == i ? Colors.red : Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(2, 2))
                            ]),
                      )
                  ],
                )
              ],
            );
  }
}