import 'package:flutter/material.dart';
import 'package:video_example/page/signup.dart';
import 'basics_page.dart';


class SigninOrSignupScreen extends StatefulWidget {
  @override
  State<SigninOrSignupScreen> createState() => _SigninOrSignupScreenState();
}

class _SigninOrSignupScreenState extends State<SigninOrSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  //final _auth = FirebaseAuth.instance;
  // final AuthService _auth = AuthService();
  var _loginEmail;
  var _loginPasssword;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.asset('assets/VLC-Logo-2001.png',
                          height: 180),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.perm_contact_calendar_outlined),
                            border: OutlineInputBorder(),
                            labelText : 'Email',
                          ),
                          onChanged: (value) {
                            setState(() => _loginEmail = value);
                            //_loginEmail = value;
                          },
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'Enter email';
                          //   }
                          //   return null;
                          // },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(),
                            labelText : 'Password',
                          ),
                          onChanged: (value) {
                            setState(() => _loginPasssword = value);
                            //_loginPasssword = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                              padding: EdgeInsets.all(20*0.75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40)),
                              ),
                              onPressed: () async {
                                print(_loginEmail);
                                print(_loginPasssword);
                                // if (_formKey.currentState.validate()) {
                                //   dynamic result = await _auth.signInWithEmailAndPassword(_loginEmail,_loginPasssword);
                                //   if (result == null) {
                                //     setState(() =>
                                //     error = 'Invalid Credentials');
                                //   } else {
                                //     _formKey.currentState?.save();

                                    // Navigation
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BasicsPage()),
                                    );
                                  // }
                                // }
                              },
                              color : Colors.orange,
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(height: 20*0.5),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                          padding: EdgeInsets.all(20*0.75),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          onPressed : () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                )
                            );
                          },
                          color : Colors.orange,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          )),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20*0.75),
                        child: Text(
                          error,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}