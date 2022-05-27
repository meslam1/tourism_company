import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {

  bool isRememberMe = false;

  buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email",
          style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email,
                  color: Color(0xff4fabff),
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password",
          style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: const TextField(
            obscureText: true,
            style: TextStyle(
                color: Colors.black87
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock,
                  color: Color(0xff4fabff),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );
  }

  buildForgetPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password Pressed"),
        child: const Text("Forget Password",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  buildRemember() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value){
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          const Text("Remember me",
            style: TextStyle(
            color: Colors.white,
              fontWeight: FontWeight.bold
          ),
          ),
        ],
      ),
    );
  }

  buildLoginBtn(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print("Login Pressed"),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white,
        child: const Text("LOGIN",
          style: TextStyle(
            color: Color(0xff1587f0),
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
      ),
    );
  }

  buildSignUpBtn(){
    return GestureDetector(
      onTap: () => print("Sing Up Pressed"),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "Don't Have An Account? ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500
              )
            ),
            TextSpan(text: "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            )
          ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x661587f0),
                          Color(0x991587f0),
                          Color(0xcc1587f0),
                          Color(0xff1587f0)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                  ),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Sign In",
                          style: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 50),
                        buildEmail(),
                        const SizedBox(height: 20),
                        buildPassword(),
                        buildForgetPassword(),
                        buildRemember(),
                        buildLoginBtn(),
                        buildSignUpBtn(),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        )
    );
  }
}







