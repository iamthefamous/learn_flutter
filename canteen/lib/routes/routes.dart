import 'package:canteen/Pages/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/login_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/sign-up': (context) => const SignUp(),
};
