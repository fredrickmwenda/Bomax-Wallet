import 'package:bodax_wallet/constants/constants.dart';
import 'package:bodax_wallet/presentation/core/widgets/rounded_button.dart';
import 'package:bodax_wallet/presentation/pages/Authentication/signup_page.dart';
import 'package:bodax_wallet/widget/password_field.dart';
import 'package:bodax_wallet/widget/text_button.dart';
import 'package:bodax_wallet/widget/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF212121),
       
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,color: Color(0xFF909093))
          
        ),
      ),


      body:SafeArea(
        child: Container(

          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF212121),


          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[


              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget>[

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),

                        const Text('Welcome Back',style:
                        TextStyle(
                            color: Color(0xFF909093),
                            fontSize: 35,
                            fontWeight: FontWeight.bold
                        ),
                        ),

                        const SizedBox(height: 10,),

                        const Text('Youve been missed!',style:
                        TextStyle(
                            color: Color(0xFF909093),
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                        ),

                        const SizedBox(height: 70),

                         Container(
                          width: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              const MyTextField(
                                hintText: 'Phone, email or username', 
                                inputType: TextInputType.text,
                              ),
                              MyPasswordField(
                                isPasswordVisible: isPasswordVisible,
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),


                              const SizedBox(height: 10,),

                            ],
                          ),

                        ),


                        const SizedBox(height: 20,),
                        // RoundedButton(text: text, press: press),
                        RoundedButton(
                          text: 'Sign In', 
                          press: (){
// Navigator.push(context,MaterialPageRoute(builder: (context) => SignIn()),);
                          }
                        ),


                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Dont't have an account? ",
                              style: kBodyText,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const SignUpPage()
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),

                  ]
              ),



            ],
          ),
        ),
      ),
    );
  }
      // body: SafeArea(

      //   child: Container(
      //     width: double.infinity,
      //     height: 270,
      //     decoration: const BoxDecoration(
      //       color: Color(0xFF212121),
      //     ),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: <Widget>[
      //                 SizedBox(height: 60),
      //                 const Text(
      //                   'Welcome back.',
      //                   style: TextStyle(
      //                     color: Color(0xFF909093),
      //                     fontSize: 35,
      //                     fontWeight: FontWeight.bold
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 10,
      //                 ),
      //                 const Text(
      //                   "You've been missed!",
      //                   style: TextStyle(
      //                     color: Color(0xFF909093),
      //                     fontSize: 35,
      //                     fontWeight: FontWeight.bold
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 60,
      //                 ),
      //                 const MyTextField(
      //                   hintText: 'Phone, email or username', 
      //                   inputType: TextInputType.text,
      //                 ),
      //                 MyPasswordField(
      //                   isPasswordVisible: isPasswordVisible,
      //                   onTap: () {
      //                     setState(() {
      //                       isPasswordVisible = !isPasswordVisible;
      //                     });
      //                   },
      //                 ),
      //               ],

      //             )
      //           ],
      //         )
      //       ]
      //     )

      //   )
        //to make page scrollable
        // child: CustomScrollView(
        //   reverse: true,
        //   slivers: [
        //     SliverFillRemaining(
        //       hasScrollBody: false,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: [
                    
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   const Text(
        //                     'Welcome back.',
        //                     style: kHeadline,
        //                   ),
        //                   const SizedBox(
        //                     height: 10,
        //                   ),
        //                   const Text(
        //                     "You've been missed!",
        //                     style: kBodyText2,
        //                   ),
        //                   const SizedBox(
        //                     height: 60,
        //                   ),
        //                   const MyTextField(
        //                     hintText: 'Phone, email or username', 
        //                     inputType: TextInputType.text,
        //                   ),
        //                   MyPasswordField(
        //                     isPasswordVisible: isPasswordVisible,
        //                     onTap: () {
        //                       setState(() {
        //                         isPasswordVisible = !isPasswordVisible;
        //                       });
        //                     },
        //                   ),
        //                 ],
        //               ),
                    

        //             const SizedBox(
        //               height: 20,
        //             ),
        //             const MyTextButton(
        //               buttonName: 'Sign In', 
        //               bgColor: Colors.white, 
        //               textColor:  Colors.black87,
        //             ),
        //             const SizedBox(
        //               height: 20,
        //             ),                   
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 const Text(
        //                   "Dont't have an account? ",
        //                   style: kBodyText,
        //                 ),
        //                 GestureDetector(
        //                   onTap: () {
        //                     Navigator.push(
        //                       context,
        //                       CupertinoPageRoute(
        //                         builder: (context) => const SignUpPage()
        //                       ),
        //                     );
        //                   },
        //                   child: Text(
        //                     'Register',
        //                     style: kBodyText.copyWith(
        //                       color: Colors.white,
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
   
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
     
  }


