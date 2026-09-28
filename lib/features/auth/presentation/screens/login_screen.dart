import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rezero/core/translations/translation_provider.dart';
import 'package:rezero/shared/widgets/rezero_text_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF11998e), Color(0xFF38ef7d)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ).animate().fade(duration: 400.ms),

                const SizedBox(height: 40),

                Text(
                  ref.tr('sign_in'),
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ).animate().fade().slideX(begin: -0.2, end: 0, duration: 500.ms),

                const SizedBox(height: 10),
                Text(
                  'Welcome back to a greener future!',
                  style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9), fontSize: 16),
                ).animate().fade(delay: 200.ms),

                const SizedBox(height: 50),

                ReZeroTextField(
                  hintText: ref.tr('email'),
                  icon: Icons.email_outlined,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ).animate().fade().slideY(begin: 0.2, end: 0, duration: 500.ms),
                const SizedBox(height: 20),

                ReZeroTextField(
                  hintText: ref.tr('password'),
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  isPassword: true,
                ).animate().fade().slideY(begin: 0.2, end: 0, duration: 500.ms),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Connect to Supabase Auth!
                      // Mock success: Navigate to a future Home Dashboard
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Login successful! (Mock)')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF11998e),
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      ref.tr('sign_in'),
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ).animate().fade().scale(delay: 400.ms),

                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () => context.push('/signup'),
                    child: Text(
                      ref.tr('dont_have_account'),
                      style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9)),
                    ),
                  ),
                ).animate().fade(delay: 600.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}