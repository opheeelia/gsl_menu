import 'package:flutter/material.dart';
import 'package:gsl_menu/services/auth.dart';

enum MobileVerificationState { MOBILE_FORM, OTP_FORM }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  MobileVerificationState currentState = MobileVerificationState.MOBILE_FORM;

  // TODO: Step 1 - Create text controllers

  final AuthService auth = AuthService.instance;

  late String verificationId;

  bool loading = false;

  getMobileFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          // TODO: Step 1
          decoration: const InputDecoration(hintText: "Phone Number"),
        ),
        const SizedBox(
          height: 16,
        ),
        FlatButton(
          // TODO: Step 2 - Fill in callback for first step
            onPressed: () {},
            child: const Text("Verify")),
        const Spacer()
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          // TODO: Step 1
          decoration: const InputDecoration(hintText: "OTP"),
        ),
        const SizedBox(
          height: 16,
        ),
        FlatButton(
          // TODO: Step 4 - Fill in callback
            onPressed: () {},
            child: const Text("Verify")),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.MOBILE_FORM
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
        ));
  }
}
