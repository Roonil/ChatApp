import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const OtpScreen());
}

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OTP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black12,
        textTheme: TextTheme(
          headline1: GoogleFonts.ubuntu(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headline2: GoogleFonts.ubuntu(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline3: GoogleFonts.ubuntu(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headline4: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          headline5: GoogleFonts.ubuntu(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.purple[300],
          ),
          subtitle1: GoogleFonts.ubuntu(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.purple[300],
          ),
        ),
      ),
      home: const FinalView(),
    );
  }
}

class FinalView extends StatelessWidget {
  const FinalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        leading: const Icon(
          CupertinoIcons.back,
          color: Colors.purple,
          size: 30,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const TopTexts(),
            Otp(),
            const ResendCode(),
            Expanded(child: Container()),
            BottomButton(size: size)
          ],
        ),
      ),
    ));
  }
}

/// Two Bottom Button
class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width,
      height: size.height * 0.07,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        MaterialButton(
          onPressed: () {},
          minWidth: size.width / 2.2,
          height: size.height * 0.06,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.purple, width: 2)),
          child: Text("Resend", style: textTheme.subtitle1),
        ),
        MaterialButton(
          onPressed: () {},
          color: Colors.purple[300],
          minWidth: size.width / 2.2,
          height: size.height * 0.06,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text("Confirm",
              style: textTheme.subtitle1?.copyWith(color: Colors.white)),
        ),
      ]),
    );
  }
}

/// Resend Code Text
class ResendCode extends StatelessWidget {
  const ResendCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
          text: "Resend code after ",
          style: textTheme.headline3,
          children: [
            TextSpan(
                text: "1:20",
                style: textTheme.headline5?.copyWith(fontSize: 16))
          ]),
    );
  }
}

/// Otp
// ignore: must_be_immutable
class Otp extends StatelessWidget {
  Otp({
    Key? key,
  }) : super(key: key);

  var textFormFieldDecoration = InputDecoration(
    //hintText: "0",
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: Colors.purple,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 3,
        color: Colors.pink,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: size.width,
      height: size.height * 0.1,
      child: Form(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 65,
            height: 65,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: textFormFieldDecoration,
              cursorColor: Colors.pink,
              textAlign: TextAlign.center,
              cursorHeight: 30.0,
              maxLines: 1,
              style: textTheme.headline1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            width: 65,
            height: 65,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: textFormFieldDecoration,
              cursorColor: Colors.pink,
              textAlign: TextAlign.center,
              cursorHeight: 30.0,
              maxLines: 1,
              style: textTheme.headline1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            width: 65,
            height: 65,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              decoration: textFormFieldDecoration,
              cursorColor: Colors.pink,
              textAlign: TextAlign.center,
              cursorHeight: 30.0,
              maxLines: 1,
              style: textTheme.headline1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          SizedBox(
            width: 65,
            height: 65,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              decoration: textFormFieldDecoration,
              cursorColor: Colors.pink,
              textAlign: TextAlign.center,
              cursorHeight: 30.0,
              maxLines: 1,
              style: textTheme.headline1,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      )),
    );
  }
}

/// Top Texts
class TopTexts extends StatelessWidget {
  const TopTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: size.width,
      height: size.height * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Verification code", style: textTheme.headline2),
          const SizedBox(
            height: 2,
          ),
          Text("We have sent the verification code to",
              style: textTheme.headline3),
          const SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
              text: "+9199*****059 ",
              style: textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
