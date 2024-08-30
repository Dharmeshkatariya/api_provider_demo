import 'package:intl/intl.dart';

bool isDifferentDay(DateTime d1, DateTime d2) =>
    DateTime(d1.year, d1.month, d1.day)
        .difference(DateTime(d2.year, d2.month, d2.day))
        .inDays !=
    0;

String getDirectConversationId(List<String> uids) {
  final aux = uids..sort((a, b) => a.compareTo(b));
  return "direct_${aux.first.substring(0, 14)}${aux.last.substring(0, 14)}";
}

bool isDirectConversation(String? conversationId) {
  return conversationId?.startsWith("direct_") == true;
}

String getTimeAsAmPm(DateTime dateTime) {
  return DateFormat('hh:mm a').format(dateTime);
}

String getTimeAndDateAsString(DateTime dateTime) {
  var time = getTimeAsAmPm(dateTime);
  final now = DateTime.now();
  if (dateTime.day == now.day &&
      dateTime.month == now.month &&
      dateTime.year == now.year) {
    return "$time\n\nToday";
  }
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  if (dateTime.day == yesterday.day &&
      dateTime.month == yesterday.month &&
      dateTime.year == yesterday.year) {
    return "$time\n\nYesterday";
  }
  var otherDate = getDateInFormat(dateTime, format: 'MM/dd/yyyy');
  return "$time\n\n$otherDate";
}

DateTime parseStringDate(String dateString,
    {String format = 'yyyy-MM-d', bool localFromUTc = false}) {
  if (dateString.isEmpty) return DateTime.now();
  if (dateString.contains('am') || dateString.contains('pm')) {
    dateString =
        dateString.replaceFirst(' pm', ' PM').replaceFirst(' am', ' AM');
  }
  var date = DateFormat(format).parse(dateString, localFromUTc).toLocal();
  return date;
}

String getDateInFormat(DateTime dateTime, {String format = 'd/M/yyyy'}) {
  return DateFormat(format).format(dateTime);
}

bool parseBool(dynamic value) {
  switch (value) {
    case true:
      return true;
    case false:
      return false;
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      return false;
  }
}
String convertMilliSecondsToDateFormat(double timeInMilli, {String dateFormat = "hh:mm a"}){

  var format = DateFormat(dateFormat);
  var date = DateTime.fromMillisecondsSinceEpoch(timeInMilli.toInt());
  return format.format(date);
}
