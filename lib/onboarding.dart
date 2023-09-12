import 'package:flutter/material.dart';
import 'package:onboarding_screens/constants.dart';
import 'package:onboarding_screens/custom_elevated_button.dart';
import 'package:onboarding_screens/content_model.dart';
import 'package:onboarding_screens/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SizedBox(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: contents.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image(
                                  image: AssetImage(contents[i].image),
                                )),
                          ),
                          SizedBox(width: screenWidth),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                contents[i].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 27,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Text(
                            contents[i].description,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });

                        pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        height: 10.0,
                        width: (index == currentIndex) ? 20 : 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: (index == currentIndex)
                              ? (const Color.fromARGB(255, 27, 89, 101))
                              : (Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                CustomElevatedButton(
                  activeColor: kActiveButtonColor,
                  inactiveColor: kInactiveButtonColor,
                  textColor: Colors.white,
                  screenWidth: screenWidth,
                  process: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.bounceIn);
                    }
                  },
                  title: //(currentIndex == contents.length - 1)
                      // ? 'End of Pages'
                      'Next',
                ),
                CustomElevatedButton(
                  activeColor: Colors.grey,
                  inactiveColor: Colors.white,
                  textColor: Colors.black,
                  title: 'Skip',
                  process: () {},
                  screenWidth: screenWidth,
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
