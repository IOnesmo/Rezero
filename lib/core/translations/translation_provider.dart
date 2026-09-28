import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// 1. Supported Languages
enum AppLanguage {
  english('en', 'English'),
  french('fr', 'Français'),
  kinyarwanda('rw', 'Ikinyarwanda');

  final String code;
  final String name;
  const AppLanguage(this.code, this.name);
}

// 2. The Translation Dictionary
class AppTranslations {
     final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'ReZero',
      'welcome_title': 'Welcome to ReZero',
      'welcome_subtitle': 'Rwanda\'s first smart waste marketplace.',
      'get_started': 'Get Started',
      'already_have_account': 'Already have an account? Sign In',
      'select_language': 'Select Your Language',
      // New Card Texts
      'card1_title': 'For Households',
      'card1_desc': 'Turn your sorted waste into cash. Snap a photo, schedule a pickup, and get paid directly to your MoMo.',
      'card2_title': 'For Collectors',
      'card2_desc': 'Smart routing and fair pay. Find the nearest bins, optimize your route, and grow your daily earnings.',
      'card3_title': 'For Our Planet',
      'card3_desc': 'Join 3.4 million Rwandans in building a zero-waste, circular economy. Every bin counts!',
      'footer_text': 'Ready to make a difference?',
    },
    'fr': {
      'app_name': 'ReZero',
      'welcome_title': 'Bienvenue sur ReZero',
      'welcome_subtitle': 'Le premier marché intelligent des déchets au Rwanda.',
      'get_started': 'Commencer',
      'already_have_account': 'Déjà un compte ? Connectez-vous',
      'select_language': 'Choisissez votre langue',
      'card1_title': 'Pour les Ménages',
      'card1_desc': 'Transformez vos déchets triés en argent. Prenez une photo, planifiez un ramassage et soyez payé via MoMo.',
      'card2_title': 'Pour les Collecteurs',
      'card2_desc': 'Itinéraires intelligents et salaire équitable. Trouvez les bacs les plus proches et augmentez vos gains.',
      'card3_title': 'Pour Notre Planète',
      'card3_desc': 'Rejoignez 3,4 millions de Rwandais pour une économie circulaire sans déchets. Chaque bac compte !',
      'footer_text': 'Prêt à faire la différence ?',
    },
    'rw': {
      'app_name': 'ReZero',
      'welcome_title': 'Murakaze neza kuri ReZero',
      'welcome_subtitle': 'Isoko ya mbere y\'ubwoko bw\'imyanda mu Rwanda.',
      'get_started': 'Tangira',
      'already_have_account': 'Ufite konti? Injira',
      'select_language': 'Hitamo ururimi',
      'card1_title': 'Ku Miryango',
      'card1_desc': 'Hindura ibyondo byawe amafaranga. Fata ifoto, teganya gukusanya, uhembwe kuri MoMo.',
      'card2_title': 'Ku Bakusanya',
      'card2_desc': 'Inzira nziza n\'uburenganzira. Shaka ibyondo byegereye wongere inyungu zawe.',
      'card3_title': 'Ku Isi Yacu',
      'card3_desc': 'Injira mu banyarwanda miliyoni 3.4 kubaka ubukungu butagira ibyondo. Buri kintu kirafatika!',
      'footer_text': 'Witeguye gukora itandukaniro?',
    },
  };


  

  String translate(String key, String langCode) {
    return _localizedValues[langCode]?[key] ?? key;
  }
}

// 3. Riverpod Provider for Language State
final languageProvider = StateProvider<AppLanguage>((ref) => AppLanguage.english);

// 4. Helper Extension to easily translate anywhere
extension TranslationExtension on WidgetRef {
  String tr(String key) {
    final lang = read(languageProvider).code;
    return AppTranslations().translate(key, lang);
  }
}