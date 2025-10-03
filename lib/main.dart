import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'app_router.dart';
import 'theme/app_colors.dart';
import 'theme/app_text_styles.dart';

void main() => runApp(const AppRoot());

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (ctx, auth, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: AppColors.primary,
              textTheme: AppTextStyles.textTheme,
              fontFamily: 'Inter',
            ),
            routerConfig: AppRouter.router(auth.isAuth),
          );
        },
      ),
    );
  }
}