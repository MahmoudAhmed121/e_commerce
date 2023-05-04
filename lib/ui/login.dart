import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "images/Lafyuu.png",
                  width: 72,
                  height: 72,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Welcome to Lafyuu",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff9098B1),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  child: TextFormField(
                    controller: emailController,
                    validator: (text) {
                      if (text!.length < 8) {
                        return "Oops! Your Email Is Not Correct ";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Your Email",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xff9098B1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        prefixIcon: Icon(Icons.mail_outline)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obscureText,
                    validator: (text) {
                      if (text!.length < 6 && text.isEmpty) {
                        return " Oops! Your Password Is Not Correct ";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xff9098B1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            Icons.visibility_off,
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 57,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: Text(
                      "Sign In",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 21,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "OR",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: 150,
                      child: Divider(
                        thickness: 1,
                        height: 4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 57,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 228, 234, 252),
                      ),
                      borderRadius: BorderRadius.circular(3)),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "images/google.jpg",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9098B1)),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 57,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffEBF0FF),
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset("images/facebook.png"),
                        const SizedBox(
                          width: 100,
                        ),
                        Text(
                          "Login with FaceBook",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9098B1)),
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have a account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "regis");
                      },
                      child: Text(" Register"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 Future login() async {
    try {
      final response =
          await Dio().post("https://api.escuelajs.co/api/v1/auth/login", data: {
        "email": emailController.text,
        "password": passwordController.text,
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("welcome")));

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final accessToken =
          await prefs.setString("access_token", response.data["access_token"]);
      Navigator.pushReplacementNamed(context, "bottomBar");
      print(response.data["access_token"]);

      return response;
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("you dont have account ${e.response!.data["message"]}")));
      }
    }
  }
}
