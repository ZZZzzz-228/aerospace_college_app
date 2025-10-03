import 'package:go_router/go_router.dart';
import 'package:aerospace_college_app/ui/screens/main_wrapper.dart';

class AppRouter {
  static GoRouter router(bool loggedIn) {
    return GoRouter(
      initialLocation: loggedIn ? '/home' : '/auth',
      routes: [
        // Один главный роут со всеми экранами
        GoRoute(
          path: '/:screen',
          builder: (ctx, st) {
            final screen = st.pathParameters['screen'] ?? 'auth';
            return MainWrapper(currentScreen: screen);
          },
        ),
      ],
    );
  }
}
