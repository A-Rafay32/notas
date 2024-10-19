// import 'package:flutter/material.dart';

// import '../../app/constants/contants.dart';

// class CustomSearchField extends StatefulWidget {
//   const CustomSearchField(
//       {required this.controller,
//       required this.hint,
//       required this.suggestionList,
//       required this.onSubmit,
//       super.key});

//   final TextEditingController controller;
//   final String hint;
//   final Function(String?)? onSubmit;

//   // final String label;
//   final List<dynamic> suggestionList;

//   @override
//   State<CustomSearchField> createState() => _CustomSearchFieldState();
// }

// class _CustomSearchFieldState extends State<CustomSearchField> {
//   @override
//   Widget build(BuildContext context) {
//     return SearchField(
//         controller: widget.controller,
//         readOnly: true,
//         itemHeight: 50,
//         maxSuggestionsInViewPort: 6,
//         suggestionStyle:
//             const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//         suggestionsDecoration: SuggestionDecoration(
//           padding: const EdgeInsets.only(left: 30),
//           color: primaryColor.withOpacity(0.20),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         onSubmit: widget.onSubmit,
//         suggestions: widget.suggestionList
//             .map((e) => SearchFieldListItem(e, child: Text(e)))
//             .toList(),
//         searchInputDecoration: TextFieldDecoration("Select Category"));
//   }
// }
