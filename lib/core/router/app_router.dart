import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rezero/features/auth/presentation/screens/login_screen.dart';
import 'package:rezero/features/auth/presentation/screens/signup_screen.dart';
import 'package:rezero/features/auth/presentation/screens/welcome_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);