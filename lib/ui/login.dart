import 'package:e_commerce/ui/register_form.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
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
                     Navigator.pushReplacementNamed(context, "home");
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
                  onPressed: () {
                    
                  },
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
                     
                    },
                    child: Text(" Register"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
