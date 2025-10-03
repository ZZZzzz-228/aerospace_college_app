import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final bool loggedIn;
  const BottomNavBar({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    final publicItems = [
      _NavItem('/contacts',  const NavigationDestination(icon: Icon(Icons.call),    label: 'Контакты')),
      _NavItem('/applicant', const NavigationDestination(icon: Icon(Icons.school),  label: 'Абитуриенту')),
      _NavItem('/auth',      const NavigationDestination(icon: Icon(Icons.person),  label: 'Профиль')),
    ];
    final privateItems = [
      _NavItem('/home',      const NavigationDestination(icon: Icon(Icons.home),    label: 'Главное')),
      _NavItem('/schedule',  const NavigationDestination(icon: Icon(Icons.schedule),label: 'Расписание')),
      _NavItem('/news',      const NavigationDestination(icon: Icon(Icons.article), label: 'Новости')),
      _NavItem('/vacancies', const NavigationDestination(icon: Icon(Icons.work),    label: 'Вакансии')),
      _NavItem('/profile',   const NavigationDestination(icon: Icon(Icons.person),  label: 'Профиль')),
    ];

    final items = loggedIn ? privateItems : publicItems;
    final loc   = GoRouterState.of(context).uri.toString();
    final idx   = items.indexWhere((e) => loc.startsWith(e.route));

    return NavigationBar(
      selectedIndex: idx < 0 ? 0 : idx,
      destinations : items.map((e) => e.dest).toList(),
      onDestinationSelected: (i) => context.go(items[i].route),
    );
  }
}

class _NavItem {
  final String route;
  final NavigationDestination dest;
  _NavItem(this.route, this.dest);
}