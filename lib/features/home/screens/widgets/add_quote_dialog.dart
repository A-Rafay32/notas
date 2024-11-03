import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/constants/firebase_constants.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/utils/gen_random_ids.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/quotes/models/quotes.dart';
import 'package:notas/features/quotes/providers/quotes_notifier.dart';
import 'package:notas/features/quotes/screens/quote_screen.dart';

class AddButton extends ConsumerStatefulWidget {
  const AddButton({super.key, required this.collectionId});

  final String collectionId;
  @override
  ConsumerState<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends ConsumerState<AddButton> {
  final TextEditingController quoteController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  void dispose() {
    quoteController.dispose();
    authorController.dispose();
    super.dispose();
  }

  void clear() {
    quoteController.clear();
    authorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _AddTodoPopupCard(
                authorController: authorController,
                quoteController: quoteController,
                onPressed: () => addQuote(ref, context));
          }));
        },
        child: Hero(
            tag: "add-pop-up-tag",
            child: Material(
              color: AppColors.secondaryColor,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Icon(
                  Icons.add,
                  size: 40.sp,
                  color: AppColors.backgroundColor,
                ),
              ),
            )));
  }

  void addQuote(WidgetRef ref, BuildContext context) {
    final String userId = ref.read(currentUserProvider)?.uid.toString() ?? "";
    // final String collectionId =  ref

    final Quote quote = Quote(
        id: generateId(),
        quotes: quoteController.text.trim().toString(),
        author: authorController.text.trim().toString(),
        userId: userId,
        collectionIds: [widget.collectionId]);

    ref.read(quoteNotifier.notifier).addQuote(quote, context);
    context.pop();
  }
}

class _AddTodoPopupCard extends StatelessWidget {
  /// {@macro add_todo_popup_card}
  const _AddTodoPopupCard(
      {required this.authorController,
      required this.quoteController,
      required this.onPressed});

  final TextEditingController quoteController;
  final TextEditingController authorController;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: "add-pop-up-tag",
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: AppColors.secondaryColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: quoteController,
                      decoration: const InputDecoration(
                        hintText: 'Write a quote',
                        hintStyle:
                            TextStyle(fontSize: 19, color: Colors.black87),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                      style: const TextStyle(color: Colors.black, fontSize: 21),
                      maxLines: 4,
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.6,
                    ),
                    TextField(
                      controller: authorController,
                      decoration: const InputDecoration(
                        hintText: 'Author',
                        hintStyle:
                            TextStyle(fontSize: 19, color: Colors.black87),
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.black,
                      maxLines: 1,
                      style: const TextStyle(color: Colors.black, fontSize: 21),
                    ),
                    const Divider(
                      color: Colors.black,
                      thickness: 0.6,
                    ),
                    IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          Icons.check,
                          size: 40.sp,
                          color: AppColors.backgroundColor,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({
    required WidgetBuilder builder,
    super.settings,
    super.fullscreenDialog,
  }) : _builder = builder;

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}

class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    @required begin,
    @required end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin?.left, end?.left, elasticCurveValue) ?? 0.0,
      lerpDouble(begin?.top, end?.top, elasticCurveValue) ?? 0.0,
      lerpDouble(begin?.right, end?.right, elasticCurveValue) ?? 0.0,
      lerpDouble(begin?.bottom, end?.bottom, elasticCurveValue) ?? 0.0,
    );
  }
}
