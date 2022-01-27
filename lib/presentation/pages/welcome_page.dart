import 'package:bodax_wallet/presentation/pages/Authentication/signin_page.dart';
import 'package:bodax_wallet/presentation/pages/Authentication/signup_page.dart';
import 'package:flutter/material.dart';

// class WelcomePage extends StatelessWidget {
//   final _pageViewController = new PageController(initialPage: 0);

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/crypto.jpg'),
            fit: BoxFit.cover,
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),
      child: Padding(
        padding: EdgeInsets.all(23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //We take the image from the assets
            // Image.asset(
            //   'assets/crypto.jpg',
            //   height: 250,
            // ),
            const SizedBox(
              height: 20,
            ),
            //Texts and Styling of them
            const Text(
              'Create a free account',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(height: 10),
            RoundedButton(
              text: 'Create an Account', 
              color: Colors.red,
              textColor: Colors.white, 
              width: size.width * 0.6,
              onTap:  () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpPage();
                      },
                    ),
                  );
                },
            ),

            const SizedBox(height: 5),

            RoundedButton(
              text: 'Login', 
              color: Colors.red,
              textColor: Colors.white, 
              width: size.width * 0.6,
              onTap:  () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignInPage();
                      },
                    ),
                  );
                },
            ),
          ],
        ),
      ),
      )
      )
      
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.color,
    required this.textColor,
    VoidCallback? onTap, 
    required this.width,
  })  : _onTap = onTap,
        super(key: key);

  final String text;
  // final Function press;
  final Color color, textColor;
  final VoidCallback? _onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: _onTap,
          style: ElevatedButton.styleFrom(
              primary: color,
              
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.w500
              )
          ),
          // child: Ink(
          //   decoration: const BoxDecoration(
          //     gradient: LinearGradient(
          //     colors: [
          //        Color(0xFFffb421),
          //         Color(0xFFff7521)
          //     ]),
              

          //   ),

          // child: Text(
          //   text,
          //   style: TextStyle(color: textColor),
          // ),

          // )
        
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
