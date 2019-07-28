class DateUtil{

  static formatDate(int time) {
    var dt = new DateTime.fromMillisecondsSinceEpoch(time);

    StringBuffer sb = new StringBuffer();
    sb.write(dt.year);
    sb.write('-');
    sb.write(dt.month.toString().padLeft(2, '0'));
    sb.write('-');
    sb.write(dt.day.toString().padLeft(2, '0'));
    sb.write(' ');
    sb.write(dt.hour.toString().padLeft(2, '0'));
    sb.write(':');
    sb.write(dt.minute.toString().padLeft(2, '0'));
    sb.write(':');
    sb.write(dt.second.toString().padLeft(2, '0'));
    return sb.toString();
  }

  static formatDateSimple(DateTime dt) {
    StringBuffer sb = new StringBuffer();
    sb.write(dt.year.toString());
    sb.write(dt.month.toString().padLeft(2, '0'));
    sb.write(dt.day.toString().padLeft(2, '0'));
    return sb.toString();
  }

}