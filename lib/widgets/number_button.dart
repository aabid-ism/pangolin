import 'package:flutter/material.dart';

class NumberBox extends StatelessWidget {
  final String number;
  final VoidCallback? onPressed;
  final String? subtitle;

  const NumberBox(
      {super.key, required this.number, this.onPressed, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      // style: ButtonStyle(
      //   padding: MaterialStateProperty.all(
      //     EdgeInsets.all(15),
      //   ),
      //   fixedSize: MaterialStateProperty.all(Size(150, 80)),
      // ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle != null ? subtitle! : "letters",
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
