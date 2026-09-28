import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rezero/core/translations/translation_provider.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  void _showLanguageSelector(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
              const SizedBox(height: 20),
              Text(ref.tr('select_language'), style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              ...AppLanguage.values.map((lang) => ListTile(
                leading: Radio<AppLanguage>(value: lang, groupValue: ref.read(languageProvider), onChanged: (v) { ref.read(languageProvider.notifier).state = v!; Navigator.pop(context); }),
                title: Text(lang.name, style: GoogleFonts.poppins()),
              )),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeatureCard(String title, String desc, IconData icon, int delay, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15), // Glassmorphism effect
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(icon, color: const Color(0xFF11998e), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(desc, style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9), fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    ).animate().fade(duration: 600.ms).slideX(begin: 0.2, end: 0, delay: Duration(milliseconds: delay));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLang = ref.watch(languageProvider);
    // Responsive sizing based on screen height
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenHeight < 700; 

    return Scaffold(
      body: Stack(
        children: [
          // 1. Beautiful Organic Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF0F5132), Color(0xFF198754), Color(0xFF20C997)],
              ),
            ),
          ),
          // Floating background shapes for depth
          Positioned(top: -50, right: -50, child: Container(height: 200, width: 200, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)))),
          Positioned(bottom: 100, left: -80, child: Container(height: 300, width: 300, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)))),

          // 2. Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Bar: Logo & Language
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ReZero', style: GoogleFonts.poppins(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)).animate().fade(),
                      GestureDetector(
                        onTap: () => _showLanguageSelector(context, ref),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(0.4))),
                          child: Row(children: [const Icon(Icons.language, color: Colors.white, size: 16), const SizedBox(width: 6), Text(currentLang.name, style: GoogleFonts.poppins(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600))]),
                        ),
                      ).animate().fade(),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Welcome Header
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ref.tr('welcome_title'), style: GoogleFonts.poppins(color: Colors.white, fontSize: isSmallScreen ? 28 : 36, fontWeight: FontWeight.w800, height: 1.1)).animate().fade().slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 8),
                      Text(ref.tr('welcome_subtitle'), style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.9), fontSize: 16)).animate().fade(delay: 200.ms).slideY(begin: 0.2, end: 0),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Scrollable Cards (Responsive)
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildFeatureCard(ref.tr('card1_title'), ref.tr('card1_desc'), Icons.home_outlined, 300, ref),
                        _buildFeatureCard(ref.tr('card2_title'), ref.tr('card2_desc'), Icons.delivery_dining_outlined, 450, ref),
                        _buildFeatureCard(ref.tr('card3_title'), ref.tr('card3_desc'), Icons.eco_outlined, 600, ref),
                      ],
                    ),
                  ),

                  // Footer with Actions
                  Column(
                    children: [
                      Text(ref.tr('footer_text'), style: GoogleFonts.poppins(color: Colors.white.withOpacity(0.8), fontSize: 14, fontStyle: FontStyle.italic)).animate().fade(delay: 800.ms),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () => context.push('/signup'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF0F5132), elevation: 8, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                          child: Text(ref.tr('get_started'), style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ).animate().fade().scale(delay: 900.ms),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () => context.push('/login'),
                        child: Text(ref.tr('already_have_account'), style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, decoration: TextDecoration.underline)),
                      ).animate().fade(delay: 1000.ms),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}