import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/config/login_pref.dart';
import 'package:e_commerce/screen/home/home_screen.dart';
import 'package:e_commerce/screen/home/home_subscreen.dart';
import 'package:e_commerce/screen/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool val1 = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  authenticate() {
    Api.login(emailController.text, passwordController.text).then((value) {
      if (value.status == 200) {
        LoginPref.saveToSharedPref(value.data!.idUser!, value.data!.username!);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      } else {
        print('Login Gagal');
      }
    });
  }

  @override
  void initState() {
    LoginPref.checkPref().then((value) {
      if (value) {
        //jika user sudah login maka masuk ke halaman home
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sign In",
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w700, color: Colors.deepPurple),
            ),
            SizedBox(
              height: 70,
            ),

            //input username
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45, width: 1)),
              child: TextFormField(
                controller: emailController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.person_2_outlined),
                  border: InputBorder.none,
                ),
              ),
            ),

            //input password
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
              height: 15,
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: ElevatedButton(
                onPressed: () {
                  authenticate();
                },
                child: Text("Login"),
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

            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password",
                style: TextStyle(color: Colors.grey),
              ),
            ),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.black87),
                  ),
                  TextSpan(
                    text: "Sign up here!",
                    style: TextStyle(color: Colors.grey),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
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
