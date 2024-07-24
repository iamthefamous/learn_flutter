import 'package:canteen/Widgets/custom_button.dart';
import 'package:canteen/Widgets/custom_text_button.dart';
import 'package:canteen/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password1 = TextEditingController();
  final TextEditingController _password2 = TextEditingController();

  void _signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      print('Account created successfully');

      Navigator.pop(context);
    } else {
      print('Enter valid Credentials');
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a valid email';

    final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(value)) return 'Please enter a valid email';

    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid phone number';
    } else if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validatePassword1(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid password';
    } else if (value.length < 8) {
      return 'Please enter valid password';
    }
    return null;
  }

  String? _validatePassword2(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    } else if (value != _password1.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    CustomTextFormField(
                      controller: _email,
                      labelText: "Email",
                      icon: Icons.email,
                      validator: _validateEmail,
                    ),
                    CustomTextFormField(
                      controller: _phone,
                      labelText: "Phone Number",
                      icon: Icons.phone,
                      validator: _validatePhone,
                    ),
                    CustomTextFormField(
                      controller: _password1,
                      labelText: "Password",
                      icon: Icons.lock,
                      validator: _validatePassword1,
                    ),
                    CustomTextFormField(
                      controller: _password2,
                      labelText: "Re-enter Password",
                      icon: Icons.lock,
                      validator: _validatePassword2,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'SIGN UP',
                      onPressed: _signUp,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 64,
            right: 64,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomTextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  text: "Already have account? LOG IN >",
                  fontSize: 18,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
