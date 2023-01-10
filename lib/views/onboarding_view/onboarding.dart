import 'package:flutter/material.dart';
import 'package:pillset/commons/utils/colors.dart';
import 'package:pillset/commons/utils/routes.dart';
import 'package:pillset/model/onboard_module.dart';
import 'onboarding_class.dart';

class OnBoradingPage extends StatefulWidget {
  const OnBoradingPage({super.key});

  @override
  State<OnBoradingPage> createState() => _OnBoradingPageState();
}

class _OnBoradingPageState extends State<OnBoradingPage> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PageNotifier pageNotifier = PageNotifier();
     return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: pageNotifier,
          builder: (context, value, child) {
            return Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        controller: controller,
                        itemCount: onboardItems.length,
                        onPageChanged: (index) {
                          pageNotifier.uponPressed(index);
                        },
                        itemBuilder: (context, i) => OnBoardingContent(
                              content: onboardItems[i].content,
                              images: onboardItems[i].image,
                              title: onboardItems[i].title,
                            ))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Row(
                    children: [
                      ...List.generate(onboardItems.length,
                          (index) => Indicator(isActive: index == value)),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        width: 132,
                        child: ElevatedButton.icon(
                          onPressed: ()async {
                            value == 2? await Navigator.of(context).pushNamed(signInRoute):
                            controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInCirc);
                          },
                          label: Text(value == 2 ? 'Get Started' : 'Next'),
                          icon: const Icon(Icons.arrow_forward_ios),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(green),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    ));
  }
}

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: isActive ? 12 : 4,
        width: 4,
        decoration: BoxDecoration(
            color: isActive ? green : whiteGrey,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class PageNotifier extends ValueNotifier<int> {
  PageNotifier.sharedInference() : super(0);
  static final PageNotifier _shared = PageNotifier.sharedInference();
  factory PageNotifier() => _shared;
  void uponPressed(int pageIndex) {
    value = pageIndex;
    notifyListeners();
  }
}
