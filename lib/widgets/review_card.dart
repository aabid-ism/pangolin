// import 'package:flutter/material.dart';

// class ReviewCard extends StatelessWidget {
//   final String heading;
//   final VoidCallback onPressed;

//   const ReviewCard({
//     required this.heading,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 15.0),
//       child: InkWell(
//         onTap: onPressed,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           height: MediaQuery.of(context).size.height / 8,
//           width: 200,
//           child: Center(
//               child: Text(
//             heading,
//             style: const TextStyle(fontSize: 18, color: Colors.white),
//             textAlign: TextAlign.center,
//           )),
//         ),
//       ),
//     );
//   }
// }
