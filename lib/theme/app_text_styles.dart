import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const _base = TextStyle(fontFamily: 'Inter');

  static final textTheme = TextTheme(
    bodyLarge  : _base.copyWith(fontSize: 16, color: AppColors.textPrimary),
    bodyMedium : _base.copyWith(fontSize: 14, color: AppColors.textPrimary),
    titleLarge : _base.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
  );
}