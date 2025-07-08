import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_typography.dart';

class ModuleTile extends StatelessWidget {
  final String moduleTitle;
  final int moduleIndex;
  final VoidCallback onTap;
  const ModuleTile({
    super.key,
    required this.moduleTitle,
    required this.moduleIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 3,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        leading: Text(
          moduleIndex.toString(),
          style: AppTypography.labelLarge.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.pureWhite,
          ),
        ),
        title: Text(
          moduleTitle,
          style: AppTypography.labelLarge.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.pureWhite,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.pureWhite),
        onTap: onTap,
      ),
    );
  }
}
