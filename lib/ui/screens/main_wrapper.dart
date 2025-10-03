import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../widgets/bottom_nav_bar.dart';

// Public screens
import 'public/auth_screen.dart';
import 'public/contacts_screen.dart';
import 'public/applicant_screen.dart';

// Private screens
import 'private/home_screen.dart';
import 'private/schedule_screen.dart';
import 'private/news_screen.dart';
import 'private/vacancies_screen.dart';
import 'private/profile_screen.dart';

class MainWrapper extends StatelessWidget {
  final String currentScreen;

  const MainWrapper({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F5F5),
          body: _getScreen(currentScreen, authProvider.isAuth),
          bottomNavigationBar: BottomNavBar(loggedIn: authProvider.isAuth),
        );
      },
    );
  }

  Widget _getScreen(String screen, bool isAuth) {
    // Отладочная информация
    debugPrint('🔄 MainWrapper: screen=$screen, isAuth=$isAuth');

    // Если не авторизован - показываем только публичные экраны
    if (!isAuth) {
      debugPrint('📱 Public mode - 3 tabs');
      switch (screen) {
        case 'contacts':
          debugPrint('✅ Showing ContactsScreen');
          return const ContactsScreen();
        case 'applicant':
          debugPrint('✅ Showing ApplicantScreen');
          return const ApplicantScreen();
        case 'profile':
          debugPrint('✅ Showing AuthScreen for profile tab');
          return const AuthScreen();
        case 'auth':
        default:
          debugPrint('✅ Showing AuthScreen (default)');
          return const AuthScreen();
      }
    }

    // Если авторизован - показываем приватные экраны
    debugPrint('🔐 Private mode - 5 tabs');
    switch (screen) {
      case 'contacts':
        debugPrint('✅ Showing ContactsScreen (private)');
        return const ContactsScreen();
      case 'schedule':
        debugPrint('✅ Showing ScheduleScreen');
        return const ScheduleScreen();
      case 'news':
        debugPrint('✅ Showing NewsScreen');
        return const NewsScreen();
      case 'vacancies':
        debugPrint('✅ Showing VacanciesScreen');
        return const VacanciesScreen();
      case 'profile':
        debugPrint('✅ Showing ProfileScreen (private)');
        return const ProfileScreen();
      case 'home':
      default:
        debugPrint('✅ Showing HomeScreen (default)');
        return const HomeScreen();
    }
  }
}