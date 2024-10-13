import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/themes/app_colors.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField(
      {super.key, required this.h, required this.w, this.focus, this.onTap});

  final double h;
  final FocusNode? focus;
  final double w;
  final Function()? onTap;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: widget.w * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              onTap: () {
                setState(() {});
              },
              focusNode: widget.focus,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textBlackColor, fontWeight: FontWeight.w500),
              cursorColor: Colors.black,
              cursorHeight: 16,
              controller: TextEditingController(),
              decoration: InputDecoration(
                  hintText: "Type your message",
                  hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera_alt_rounded,
                        color: widget.focus!.hasFocus
                            ? AppColors.textBlackColor
                            : Colors.grey.shade600),
                  ),
                  suffixIconColor: Colors.grey,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  filled: true,
                  fillColor: widget.focus!.hasFocus
                      ? AppColors.primaryColor.withOpacity(0.2)
                      : Colors.grey.shade200),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade200,
            ),
            child: SvgPicture.asset("assets/svgs/send.svg"),
          )
        ],
      ),
    );
  }
}
