import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  LoginHeader({
    required this.w,
    required this.text1,
    required this.text2,
    required this.text3,
    super.key,
  });

  final double w;
  String text1, text2, text3;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            text1,
            maxLines: 1,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text2,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            text3,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
