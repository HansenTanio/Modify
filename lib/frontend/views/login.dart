import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:ujianprojectflutter/frontend/Models/FavoriteModel.dart';
import 'homepage.dart';
import 'package:ujianprojectflutter/frontend/views/register.dart';
import 'package:ujianprojectflutter/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int? _radioValue = 0;
  bool visibilityPass = false;
  bool _rememberMe = false;
  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  bool _validatePassword(String password) {
    if (password.length < 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Password'),
            content: Text('Password must be at least 10 characters long.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }

  void _login() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      String password = _passwordController.text;

      if (_validatePassword(password)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(
                      Icons.email,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: !visibilityPass,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visibilityPass = !visibilityPass;
                        });
                      },
                      icon: visibilityPass
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    CheckboxListTile(
                      title: Text(
                        'Remember Me',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account yet? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Register();
                                }));
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
