import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumExtension on num {
  String toCurrency([String? sign]) {
    var f = NumberFormat("#,##0.##");
    return sign == null ? f.format(this) : "${f.format(this)} $sign";
  }

  String toFixedString({String? format, String? sign}) {
    var f = NumberFormat(format ?? "##0.##");
    return sign == null ? f.format(this) : "${f.format(this)} $sign";
  }

  BorderRadius toBorderRadius() => BorderRadius.circular(toDouble());
  BorderRadius toTopBorderRadius() =>
      BorderRadius.vertical(top: Radius.circular(toDouble()));
  BorderRadius toBottomBorderRadius() =>
      BorderRadius.vertical(bottom: Radius.circular(toDouble()));
  BorderRadius toLeftBorderRadius() =>
      BorderRadius.horizontal(left: Radius.circular(toDouble()));
  BorderRadius toRightBorderRadius() =>
      BorderRadius.horizontal(right: Radius.circular(toDouble()));
  BorderRadius toTopLefBorderRadius() =>
      BorderRadius.only(topLeft: Radius.circular(toDouble()));
  BorderRadius toTopRightBorderRadius() =>
      BorderRadius.only(topRight: Radius.circular(toDouble()));
  BorderRadius toBottomLefBorderRadius() =>
      BorderRadius.only(bottomLeft: Radius.circular(toDouble()));
  BorderRadius toBottomRightBorderRadius() =>
      BorderRadius.only(bottomRight: Radius.circular(toDouble()));
}
