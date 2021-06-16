import 'package:flutter/material.dart';

// class GlintsButton extends StatelessWidget {
//   factory GlintsButton.primary({
//     Key? key,
//     required BuildContext context,
//     bool enabled = true,
//     double elevation = 0,
//     required String text,
//     VoidCallback? onPressed,
//     EdgeInsets? padding,
//     bool isTransparent = false,
//     double? radius = 4.0,
//     Colors? textColor,
//     double? width,
//     double? height = 46.0,
//     bool isOutlined = false,
//     TextStyle? textStyle,
//     Color? borderColor,
//   }) {
//     final _theme = Theme.of(context);
//     final _primaryColor = _theme.primaryColor;
//     final _disabledColor = _theme.disabledColor;

//     // final _defaultTextStyle =
//     //     Theme.of(context).primaryTextTheme.button.copyWith(
//     //           fontSize: 14.0,
//     //           fontWeight: FontWeight.w600,
//     //           color: textColor ?? isOutlined ? _primaryColor : Colors.white,
//     //         );

//     return GlintsButton(
//       enabled: enabled,
//       elevation: elevation,
//       background: Colors.white,
//       isTransparent: isTransparent,
//       gradientDisabledColors: [
//         _disabledColor,
//         _disabledColor,
//       ],
//       gradientColors: isOutlined
//           ? [Colors.transparent, Colors.transparent]
//           : [
//               _primaryColor,
//               _primaryColor,
//             ],
//       onPressed: onPressed?.call,
//       radius: radius,
//       text: text,
//       padding: padding,
//       textStyle: textStyle ?? _defaultTextStyle,
//       width: width ?? MediaQuery.of(context).size.width,
//       height: height,
//       isOutlined: isOutlined,
//       borderColor:
//           isOutlined ? (borderColor ?? _primaryColor) : Colors.transparent,
//     );
//   }
// }
