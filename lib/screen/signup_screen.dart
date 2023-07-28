import 'package:e_commerce/screen/signin_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool val1 = true;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sign Up",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w700, color: Colors.deepPurple),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1)),
              child: TextFormField(
                controller: fullnameController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1)),
              child: TextFormField(
                controller: emailController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1)),
              child: TextFormField(
                controller: usernameController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1)),
              child: TextFormField(
                controller: passwordController,
                obscureText: val1,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock_open),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: val1 == true
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        val1 = !val1;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(
                onPressed: () {
                  print(
                      "FullName : ${fullnameController.text}, Email : ${emailController.text},Username : ${usernameController.text}, Password : ${passwordController.text}");
                },
                child: Text("Sign Up"),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(color: Colors.black87),
                  ),
                  TextSpan(
                    text: "Sign In here!",
                    style: TextStyle(color: Colors.grey),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
