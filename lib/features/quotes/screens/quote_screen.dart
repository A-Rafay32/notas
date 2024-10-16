import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/features/home/screens/widgets/add_quote_dialog.dart';

class QuoteScreen extends ConsumerWidget {
  const QuoteScreen({super.key, required this.collectionId});

  final String collectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.secondaryColor,
          onPressed: () {
            context.push(AddButton(collectionId: collectionId));
          },
          child: SvgPicture.asset(
            "assets/svgs/ai.svg",
            height: 30,
            width: 30,
            colorFilter: const ColorFilter.mode(
                AppColors.textBlackColor, BlendMode.srcIn),
          )),
    );
  }
}
