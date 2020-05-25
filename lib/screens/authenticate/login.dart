import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:login/styles/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool _isValid = false;
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 70.0, 16.0, 30.0),
                      child: Text(
                        'Hello\nThere!',
                        style: GoogleFonts.specialElite(textStyle: welcomeText),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: inputStyle.copyWith(
                              labelText: 'Your Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            validator: (val) =>
                                _isValid ? null : 'Enter a valid email.',
                            onChanged: (val) {
                              setState(() {
                                _email = val;
                                _isValid = EmailValidator.validate(_email);
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: inputStyle.copyWith(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  icon: Icon(_obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  }),
                            ),
                            validator: (val) => val.length < 6
                                ? 'Password must be greater than 6 characters.'
                                : null,
                            onChanged: (val) {
                              setState(() => _password = val);
                            },
                            obscureText: _obscureText,
                          ),
                          SizedBox(height: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(vertical: 18.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: () {
                                  _formKey.currentState.validate();
                                  print('object');
                                },
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      print("Forgot Password");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Need an account? Register.',
                                        style: TextStyle(
                                          color: Colors.indigo[900],
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 1.7,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("Forgot Password");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Forgot password?',
                                        style: TextStyle(
                                          color: Colors.indigo[900],
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 1.7,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height > 500
                      ? MediaQuery.of(context).size.height * 25 / 100
                      : MediaQuery.of(context).size.height * 40 / 100,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/google_icon.png',
                              height: 40.0,
                            ),
                          ),
                          onPressed: () {},
                          shape: CircleBorder(),
                        ),
                        RaisedButton(
                          color: Colors.blue[900],
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              'assets/facebook_icon.png',
                              height: 32.0,
                            ),
                          ),
                          onPressed: () {
                            print(MediaQuery.of(context).size.height);
                          },
                          shape: CircleBorder(),
                        ),
                        RaisedButton(
                          color: Colors.blue[300],
                          child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Image.asset(
                              'assets/twitter_icon.png',
                              height: 32.0,
                            ),
                          ),
                          onPressed: () {},
                          shape: CircleBorder(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 50);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
