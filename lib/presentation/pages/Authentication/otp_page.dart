import 'package:bodax_wallet/presentation/core/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class OtpPage extends StatefulWidget {
  bool _isInit = true;
  var _contact = '';
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String phoneNo = '';
  String smsOTP = '';
  String verificationId = '';
  String errorMessage = '';
  final FirebaseAuth _authenticate = FirebaseAuth.instance;
  
  // Timer _timer;

  @override
  //Data initialization
  void didChangeDependencies() {
    super.didChangeDependencies();
    //load data whn screen load
    if (widget._isInit) {
      widget._contact = '${}';
      otpGeneration(widget._contact);
      widget._isInit = false;

    }

    
  }

  //controller disposition
  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),

              // Image.asset(
              //   'assets/images/logo.png',
              //   width: screenWidth * 0.7,
              //   fit: BoxFit.contain,
              // ),
              // SizedBox(
              //   height: screenHeight * 0.05,
              // ),
              // Image.asset(
              //   'assets/images/varification.png',
              //   height: screenHeight * 0.3,
              //   fit: BoxFit.contain,
              // ),

              const Text(
                'OTP Verification',
                style: TextStyle(fontSize: 20, color: Color(0xFF909093)),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                'Enter the OTP code that was sent to  ${widget._contact}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Color(0xFF909093)),
              ),

              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width > 600 ? size.width * 0.2 : 16),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.025),
                      child: PinEntryTextField(
                          fields: 6,
                          onSubmit: (text) {
                            smsOTP = text as String;
                          }),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    RoundedButton(
                        text: 'Verify',
                        press: otpVerification
                        )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  

Future <void> otpGeneration(String contact) async {

  // ignore: prefer_function_declarations_over_variables
  final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
    verificationId = verId;
  };
  try{  
    await _authenticate.verifyPhoneNumber(
      phoneNumber: contact,
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
      codeSent: smsOTPSent,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential phoneAuthCredential) {
      //  print(_authenticate.currentUser!());
        // print(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        // Navigator.pop(context, exception.message);
        // if (e.code == 'invalid-phone-number') {
        //   print('The provided phone number is not valid.');
        // }
        
      }
    );
  }
  catch (e) {
    handleError(e as PlatformException);
   // Navigator.pop(context, (e as PlatformException).message);
  }
    
  

}
Future<void> otpVerification() async {
  if (smsOTP == null || smsOTP == '') {
    // showAlertDialog(context, 'please enter 6 digit otp');
    // await showDialog(
    //   context: context, 
    //   builder: (BuildContext context){
    //     return const AlertDialog(
    //       content: Text('please enter 6 digit otp'),
    //     );
    //   });
    alertDialog(context,'please enter 6 digit otp');
    return;
  }
   try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsOTP
      );

      final user = await _authenticate.signInWithCredential(credential);
      final currentUser = await _authenticate.currentUser;
      assert(user.user!.uid == currentUser!.uid);
      await Navigator.pushReplacementNamed(context, '/homeScreen');
    } catch (e) {
      handleError(e as PlatformException);
    }
  }

    void handleError(PlatformException error) {
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          errorMessage = 'Invalid Code';
        });
        alertDialog(context, 'Invalid Code');
        
        break;
      default:
      alertDialog(context, error.message!);
        
        break;
    }
  }
  
  void alertDialog(BuildContext context, String message) {
     final alert = CupertinoAlertDialog( 
        title: Text('error'),
        content: Text('\n$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],

      );
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

}



// GestureDetector(
//                         onTap: () {
//                           verifyOtp();
//                         },
//                         child: Container(
//                           margin: const EdgeInsets.all(8),
//                           height: 45,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 253, 188, 51),
//                             borderRadius: BorderRadius.circular(36),
//                           ),
//                           alignment: Alignment.center,
//                           child: const Text(
//                             'Verify',
//                             style: TextStyle(color: Colors.black, fontSize: 16.0),
//                           ),
//                         ),
//                       ),