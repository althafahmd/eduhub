import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_typography.dart';
import '../../utilities/screen_size_config.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;
  const SubjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenSizeConfig.screenWidth * 0.025,
        vertical: ScreenSizeConfig.screenWidth * 0.025,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: AppColors.primaryBlue.withAlpha(100),
          width: 3.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withAlpha(95),
            blurRadius: 10.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.white,
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: AppTypography.titleLarge.copyWith(
                            color: AppColors.primaryBlue,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          description,
                          style: AppTypography.labelLarge.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
