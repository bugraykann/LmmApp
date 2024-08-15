import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString([String separator = '.']) =>
      DateFormat('dd${separator}MM${separator}yyyy').format(this);
  String toTimeString() => DateFormat('HH:mm').format(this);
  String toDateTimeString([String pattern = 'HH:mm dd.MM.yyyy']) =>
      DateFormat(pattern).format(this);
}
