import 'package:flutter/material.dart';

class Responsive {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 100);
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 100);
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getadaptiveTextSize(BuildContext context, dynamic value) {
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
