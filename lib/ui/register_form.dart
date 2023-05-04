import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Regis extends StatefulWidget {
  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  bool obscureText = true;
  bool obscureText2 = true;

  final Forms = GlobalKey<FormState>();

  TextEditingController nameControler = TextEditingController();
  TextEditingController EmailControler = TextEditingController();
  TextEditingController Passwordone = TextEditingController();
  TextEditingController PasswordTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 1000,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 121,
                  ),
                  Image.asset(
                    "images/Vector.png",
                    width: 72,
                    height: 72,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Let’s Get Started",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff223263),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an new account",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xff9098B1),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: Forms,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameControler,
                            validator: (Texts) {
                              if (Texts!.length <= 5) {
                                return "Register your name";
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                  color: Color(
                                    0xff9098B1,
                                  ),
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.account_circle_outlined)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: EmailControler,
                            validator: (Texts) {
                              if (Texts!.length <= 3) {
                                return "Register your Email";
                              } else
                                return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Your Email",
                                hintStyle: TextStyle(
                                    color: Color(0xff9098B1), fontSize: 12),
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.mail_outline_rounded)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: Passwordone,
                            validator: (Texts) {
                              if (Texts!.length <= 3) {
                                return "Register your Password";
                              }
                              return null;
                            },
                            obscureText: obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Color(0xff9098B1),
                                fontSize: 12,
                              ),
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: obscureText
                                    ? Icon(Icons.visibility_off_rounded)
                                    : Icon(Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: PasswordTwo,
                            validator: (Texts) {
                              if (Texts!.length <= 3) {
                                return "Register your Password";
                              } else
                                return null;
                            },
                            obscureText: obscureText2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password Again",
                              hintStyle: TextStyle(
                                color: Color(0xff9098B1),
                                fontSize: 12,
                              ),
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText2 = !obscureText2;
                                  });
                                },
                                icon: obscureText2
                                    ? Icon(Icons.visibility_off_outlined)
                                    : Icon(Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 57.0,
                            margin: EdgeInsets.only(left: 16, right: 16),
                            color: Color(0xff40BFFF),
                            child: ElevatedButton(
                              onPressed: () {
                                if (Forms.currentState!.validate()) {
                                  if (Passwordone.text == PasswordTwo.text) {
                                    regis();
                                  }
                                }
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("have a account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "Login");
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 Future regis() async {
    try {
      final data =
          await Dio().post("https://api.escuelajs.co/api/v1/users/", data: {
        "name": nameControler.text,
        "email": EmailControler.text,
        "password": Passwordone.text,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      });
      Navigator.pushNamed(context, "Login");
      return data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${e.response!.data["message"]}")));
      }
    }
  }
}
