import 'package:flutter/material.dart';

import '../Widgets/custom_button.dart';
import '../Widgets/custom_text_button.dart';
import '../Widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _email.text;
      final password = _password.text;

      Navigator.pushNamed(context, '/sign-up');
    }
  }

  void _forgotPassword() {
    print('your Forgot the password, idiot');
  }

  void _signUp() {
    Navigator.pushNamed(context, '/sign-up');
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a valid email';

    final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(value)) return 'Please enter a valid email';

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid password';
    } else if (value.length < 8) {
      return 'Please enter valid password';
    }
    return null;
  }

  final String image1 = 'images/busket.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(64.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0, top: 114),
                        child: Image.asset(
                          image1,
                          height: 179.58,
                          width: 234.33,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CustomTextFormField(
                        controller: _email,
                        labelText: 'Email',
                        icon: Icons.email,
                        validator: _validateEmail,
                      ),
                      CustomTextFormField(
                        controller: _password,
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: _validatePassword,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Login',
                        onPressed: _login,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomTextButton(
                          onPressed: _forgotPassword,
                          text: 'Forgot Password?',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 64,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomTextButton(
                  onPressed: _signUp,
                  text: "SIGN UP>",
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
