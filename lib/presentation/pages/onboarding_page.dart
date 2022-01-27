
import 'package:bodax_wallet/presentation/pages/conversion_page.dart';
import 'package:bodax_wallet/presentation/pages/home_page.dart';
import 'package:bodax_wallet/utils/items.dart';
import 'package:flutter/material.dart';

// class WelcomePage extends StatelessWidget {
//   final _pageViewController = new PageController(initialPage: 0);

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  final _pageViewController =  PageController(initialPage: 0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffe0e9f8),
        elevation: 0.0,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 45,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConversionPage()
                  ),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xff347af0),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageViewController,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xffe0e9f8),
                  child: Image.asset(
                    Items.welcomeMessage[index]['image']!,
                    width: 326,
                    height: 250,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 375,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                              2,
                              (indicator) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: indicator == index
                                      ? const Color(0xff347af0)
                                      : const Color(0xffedf1f9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          //use null safety if the element doesnt have a record
                          Items.welcomeMessage[index]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Text(
                          //use null safety if the element doesnt have a record
                          Items.welcomeMessage[index]['message']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff485068),
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            if (index < 1) {
                              _pageViewController.animateToPage(index + 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            } else {
                              Navigator.push(context, 
                                MaterialPageRoute(
                                  builder: (context) => HomePage()
                                ),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: index != 1
                                  ? Colors.transparent
                                  : const Color(0xff347af0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: const BorderSide(
                                      color: Color(0xff347af0)))),
                          child: Container(
                            width: 160,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              index != 1 ? 'Next Step' : 'Let\'s Get Started',
                              style: TextStyle(
                                color: index != 1
                                    ? const Color(0xff347af0)
                                    : Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
