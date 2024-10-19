import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notas/app/themes/app_colors.dart';

class GenderFieldDropDown extends StatefulWidget {
  const GenderFieldDropDown(
      {super.key,
      required this.hint,
      required this.focus,
      required this.onTap});

  final String hint;
  final FocusNode focus;
  final Function() onTap;
  static String? selectedValue;

  @override
  State<GenderFieldDropDown> createState() => _GenderFieldDropDownState();
}

class _GenderFieldDropDownState extends State<GenderFieldDropDown> {
  final List<String> dropdownItems = [
    "Male",
    "Female",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.focus.hasFocus
                ? AppColors.primaryColor
                : Theme.of(context).shadowColor,
          ),
          color: widget.focus.hasFocus
              ? AppColors.primaryColor.withOpacity(0.2)
              : Theme.of(context).shadowColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            focusNode: widget.focus,
            buttonStyleData: ButtonStyleData(
                // overlayColor: const WidgetStatePropertyAll(Colors.transparent),
                decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            )),
            hint: Text(
              widget.hint,
              style: GoogleFonts.urbanist(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.2125,
                  color: Theme.of(context).textTheme.labelSmall!.color!),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              offset: const Offset(170, 0),
              scrollbarTheme: const ScrollbarThemeData(
                radius: Radius.circular(40),
                // thickness: WidgetStateProperty.all<double>(6),
                // thumbVisibility: WidgetStateProperty.all<bool>(true),
              ),
            ),

            value: GenderFieldDropDown
                .selectedValue, // Set the currently selected value
            // Customize the dropdown menu decoration
            items: dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child:
                    Text(value), // You can customize the dropdown item's text
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                GenderFieldDropDown.selectedValue =
                    newValue; // Update the selected value
              });
            },
          ),
        ),
      ),
    );
  }
}
