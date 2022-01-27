import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text, required this.press,
  }) : super(key: key);

  final String text;
  // final Function press;
  final void Function()? press;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 320,

        // margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [Color(0xFFffb421), Color(0xFFff7521)]),
        ),
        child: GestureDetector(
          onTap: press,
          // () {
          //   // Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);
          // },
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
