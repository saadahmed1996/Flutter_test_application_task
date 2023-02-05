import 'package:flutter/cupertino.dart';
import '../utils/app_dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  BigText({
    Key? key,
    this.fontWeight = FontWeight.w400,
    this.color = const Color(0xFFFEFCED),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size == 0 ? AppDimensions.font20 : size,
        fontWeight: fontWeight,
      ),
    );
  }
}
