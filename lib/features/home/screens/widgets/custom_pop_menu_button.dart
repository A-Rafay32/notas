import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopupMenuButton extends StatelessWidget {
  CustomPopupMenuButton({super.key, required this.popupMenuItemList});

  List<PopupMenuEntry> popupMenuItemList;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        constraints: const BoxConstraints(maxWidth: 130),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        icon: Icon(Icons.more_vert_rounded, size: 30.h, color: Colors.black),
        color: Colors.white,
        itemBuilder: (context) => popupMenuItemList);
  }
}

class PopUpButton extends StatelessWidget {
  PopUpButton({
    super.key,
    required this.press,
    required this.title,
  });

  final String title;
  GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Colors.transparent),
        onPressed: press,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(),
        ),
      ),
    );
  }
}
