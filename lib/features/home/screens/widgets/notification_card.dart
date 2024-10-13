import 'package:flutter/material.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';

class NotficationCard extends StatelessWidget {
  const NotficationCard({
    required this.text,
    required this.title,
    super.key,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(13.0),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: AppColors.primaryColor.withOpacity(0.2),
                offset: const Offset(-10, 10))
          ],
          color: AppColors.primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
