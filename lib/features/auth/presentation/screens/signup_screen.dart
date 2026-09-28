import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rezero/core/translations/translation_provider.dart';
import 'package:rezero/shared/widgets/rezero_text_field.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                ).animate().fade(duration: 400.ms),

                const SizedBox(height: 20),

                // Header Text
                Text(
                  ref.tr('create_account'),
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ).animate().fade().slideX(begin: -0.2, end: 0, duration: 500.ms),

                const SizedBox(height: 10),
                Text(
                  'Let\'s start your zero-waste journey!',
                  style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9), fontSize: 16),
                ).animate().fade(delay: 200.ms),

                const SizedBox(height: 40),

                // Form Fields
                ReZeroTextField(
                  hintText: ref.tr('full_name'),
                  icon: Icons.person_outline,
                  controller: nameController,
                ).animate().fade().slideY(begin: 0.2, end: 0, duration: 500.ms),
                const SizedBox(height: 15),

                ReZeroTextField(
                  hintText: ref.tr('email'),
                  icon: Icons.email_outlined,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ).animate().fade().slideY(begin: 0.2, end: 0, duration: 500.ms),
                const SizedBox(height: 15),

                ReZeroTextField(
                  hintText: ref.tr('phone_number'),
                  icon: Icons.phone_outlined,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ).animate().fade().slideY(begin: 0.2, end: 0, duration: 500.ms),
                const SizedBox(height: 15),

                ReZeroTextField(
                  hintText: ref.tr('password'),
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  isPassword: true,
                ).animate().fade().slideY(begin: 0.2, end: 0, duration: 500.ms),

                const SizedBox(height: 40),

                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Connect to Supabase Auth in the next phase!
                      // For now, let's just navigate to Login to show the flow
                      context.push('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF11998e),
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text(
                      ref.tr('create_account'),
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ).animate().fade().scale(delay: 400.ms),

                const SizedBox(height: 20),

                // Login Redirect
                Center(
                  child: TextButton(
                    onPressed: () => context.push('/login'),
                    child: Text(
                      ref.tr('already_have_account'),
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