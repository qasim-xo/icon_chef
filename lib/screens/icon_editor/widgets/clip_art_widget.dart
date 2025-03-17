// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:icon_chef/constants/sample_icons_constants.dart';
// import 'package:responsive_framework/responsive_framework.dart';

// class ClipArtWidget extends ConsumerWidget {
//   const ClipArtWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GridView.builder(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       itemCount: icons.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 20, // Number of columns
//         crossAxisSpacing: 10.0, // Spacing between columns
//         mainAxisSpacing: 10.0, // Spacing between rows
//         childAspectRatio: 1, // Width/Height ratio
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         final icon = icons[index].iconData;
//         return Icon(icon);
//       },
//     );
//   }
// }
