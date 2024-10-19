import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';

class CustomFieldDropDown extends StatelessWidget {
  CustomFieldDropDown({
    super.key,
    required this.hint,
    this.focus,
    required this.selectedValue,
    required this.dropdownItems,
    required this.onChanged,
  });

  final String hint;
  final FocusNode? focus;
  final List<String> dropdownItems;
  String? selectedValue;
  void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.7)),
        color: AppColors.kbackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
            focusNode: focus,
            buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            )),
            hint: Text(hint,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.w800)),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(14)),
              offset: const Offset(170, 0),
              scrollbarTheme: const ScrollbarThemeData(
                radius: Radius.circular(40),
                // thickness: WidgetStateProperty.all<double>(6),
                // thumbVisibility: WidgetStateProperty.all<bool>(true),
              ),
            ),
            value: selectedValue,
            items: dropdownItems
                .map((String value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: onChanged),
      ),
    );
  }
}
