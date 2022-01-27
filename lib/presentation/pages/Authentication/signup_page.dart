import 'package:bodax_wallet/constants/constants.dart';
import 'package:bodax_wallet/presentation/pages/Authentication/signin_page.dart';
import 'package:bodax_wallet/presentation/pages/home_page.dart';
import 'package:bodax_wallet/widget/password_field.dart';
import 'package:bodax_wallet/widget/text_button.dart';
import 'package:bodax_wallet/widget/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;
  final FirebaseAuth _authenticate = FirebaseAuth.instance;

  String _errorMessage = '';

  var name = '';
  var password = '';
  var email = '';
  var phone = '';
  var confirmPassword = '';

  final nameTextEditController = TextEditingController();
  final emailTextEditController = TextEditingController();
  final phoneTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  final confirmPasswordTextEditController = TextEditingController();

  @override
  void dispose() {
    nameTextEditController.dispose();
    emailTextEditController.dispose();
    phoneTextEditController.dispose();
    passwordTextEditController.dispose();
    confirmPasswordTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Color(0xFF909093))),
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF212121),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 60),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Color(0xFF909093),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Youve been missed!',
                                  style: TextStyle(
                                      color: Color(0xFF909093),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 70),
                                Container(
                                  width: 320,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: TextFormField(
                                          style: kBodyText.copyWith(
                                              color: Colors.white),
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.next,
                                          controller: nameTextEditController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(20),
                                            hintText: 'Email',
                                            hintStyle: kBodyText,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: TextFormField(
                                          style: kBodyText.copyWith(
                                              color: Colors.white),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          controller: emailTextEditController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(20),
                                            hintText: 'Email',
                                            hintStyle: kBodyText,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: TextFormField(
                                          style: kBodyText.copyWith(
                                              color: Colors.white),
                                          keyboardType: TextInputType.phone,
                                          textInputAction: TextInputAction.next,
                                          controller: phoneTextEditController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(20),
                                            hintText: 'Phone',
                                            hintStyle: kBodyText,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: TextFormField(
                                          style: kBodyText.copyWith(
                                              color: Colors.white),
                                          obscureText: passwordVisibility,
                                          keyboardType: TextInputType.phone,
                                          textInputAction: TextInputAction.next,
                                          decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: () {
                                                  setState(() {
                                                    passwordVisibility =
                                                        !passwordVisibility;
                                                  });
                                                },
                                                icon: Icon(
                                                  passwordVisibility
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(20),
                                            hintText: 'Password',
                                            hintStyle: kBodyText,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: TextFormField(
                                          style: kBodyText.copyWith(
                                              color: Colors.white),
                                          obscureText: passwordVisibility,
                                          keyboardType: TextInputType.phone,
                                          textInputAction: TextInputAction.next,
                                          controller:
                                              confirmPasswordTextEditController,
                                          decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: IconButton(
                                                splashColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onPressed: () {
                                                  setState(() {
                                                    passwordVisibility =
                                                        !passwordVisibility;
                                                  });
                                                },
                                                icon: Icon(
                                                  passwordVisibility
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(20),
                                            hintText: 'Confirm Password',
                                            hintStyle: kBodyText,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    width: 320,

                                    // margin: EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFFffb421),
                                        Color(0xFFff7521)
                                      ]),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) => HomePage(),
                                        //   ),
                                        // );
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            name = nameTextEditController.text;
                                            email =
                                                emailTextEditController.text;
                                            phone =
                                                phoneTextEditController.text;
                                            password =
                                                passwordTextEditController.text;
                                            confirmPassword = 
                                              confirmPasswordTextEditController.text;
                                          });
                                          registerUser();
                                        }
                                      },
                                      child: const Center(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Already have an account? ",
                                      style: kBodyText,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const SignInPage()),
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
                              ])
                        ],
                      )
                    ])),
          ),
        ],
      )),
      // body: SafeArea(
      //   child: CustomScrollView(
      //     slivers: [
      //       SliverFillRemaining(
      //         hasScrollBody: false,
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(
      //             horizontal: 20,
      //           ),
      //           child: Column(
      //             children: [

      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children:  [
      //                     //  const Text(
      //                     //   'Register',
      //                     //   style: kHeadline,
      //                     // ),
      //                     // const Text(
      //                     //   'Create new account to get started.',
      //                     //   style: kBodyText2,
      //                     // ),
      //                     // const SizedBox(
      //                     //   height: 20,
      //                     // ),
      //                     const MyTextField(
      //                       hintText: 'Name',
      //                       inputType: TextInputType.name,
      //                     ),

      //                     const MyTextField(
      //                       hintText: 'Email',
      //                       inputType: TextInputType.emailAddress,
      //                     ),
      //                     const MyTextField(
      //                       hintText: 'Phone',
      //                       inputType: TextInputType.phone,
      //                     ),
      //                     MyPasswordField(
      //                       isPasswordVisible: passwordVisibility,
      //                       onTap: (){
      //                         setState(() {
      //                           passwordVisibility = !passwordVisibility;
      //                         });
      //                       },
      //                     )

      //                   ],
      //                 ),

      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               MyTextButton(
      //                 buttonName: 'Register',
      //                 bgColor: Colors.red,
      //                 textColor: Colors.black87,
      //                 onTap: () {},
      //               ),

      //               const SizedBox(height: 10,),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   const Text(
      //                     'Already have an account? ',
      //                     style: TextStyle(
      //                       color: Colors.black87
      //                     ),
      //                   ),
      //                   GestureDetector(
      //                     onTap: () {
      //                       Navigator.push(
      //                         context,
      //                         CupertinoPageRoute(
      //                           builder: (context) => const SignInPage()
      //                         ),
      //                       );
      //                     },
      //                     child: Text(
      //                       'Sign In',
      //                       style: kBodyText.copyWith( color: Colors.black87,)

      //                     ),
      //                   ),
      //                 ],
      //               ),

      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void registerUser() async{
    if (password == confirmPassword) {
      try{
         await _authenticate.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );
      }
      catch(e){
        

      }
      
    }
  }
}
