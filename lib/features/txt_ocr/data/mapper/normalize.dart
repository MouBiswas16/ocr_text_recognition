import 'package:flutter/foundation.dart';

String normalizeNiktext(String text) {
  String result = text.toUpperCase();
  result = result.replaceAll("Nik", "").replaceAll(":", "").trim();
  return result;
}

String normalizeNameFulltext(String text) {
  String result = text.toUpperCase();
  result = result.replaceAll("NAME", "").replaceAll(":", "").trim();
  return result;
}

String normalizeGenderText(String text) {
  String result = text.toUpperCase();
  result = result.replaceAll("GENDER", "").replaceAll(":", "").trim();
  if (result == "MAN") {
    return "Man";
  }
  return result;
}

String normalizeAddessText(String text) {
  String result = text.toUpperCase();
  result = result
      .replaceAll("ADDRESS", "")
      .replaceAll("PERMANENT ADDESS", "")
      .replaceAll("PRESENT ADDRESS", "")
      .replaceAll("VILLAGE", "")
      .replaceAll(":", "")
      .replaceAll("", "")
      .trim();
  if (kDebugMode) {
    print("result result result result result" + result);
  }
  return result;
}

String normalizeMaritialStatusText(String text) {
  String result = text.toUpperCase();
  result = result.replaceAll("MARITIALSTATUS", "").replaceAll(":", "").trim();
  return result;
}

String normalizeWorkText(String text) {
  String result = text.toUpperCase();
  result = result.replaceAll("WORK", "").replaceAll(":", "").trim();
  if (result == "WORK" || result == "STUDENT" || result == "") {
    return "Student";
  }
  return result;
}

String normalizeReligionText(String text) {
  String result = text.toUpperCase();
  result = result
      .replaceAll("RELIGION", "")
      .replaceAll("REALIGION", "")
      .replaceAll(":", "")
      .trim();
  if (result == "ISLAM" || result == "ISLA M") {
    return result = "ISLAM";
  }
  if (result.trim().isEmpty) {
    return "";
  } else {
    return result;
  }
}

String normalizeCompanyText(String text) {
  String result = text.toUpperCase();
  result = result
      .replaceAll("COMPANY NAME", "")
      .replaceAll(":", "")
      .replaceAll("", "")
      .trim();
  return result;
}

String normalizeEmailText(String text) {
  String result = text.toUpperCase();
  result = result
      .replaceAll("EMAIL", "")
      .replaceAll("-", "")
      .replaceAll(":", "")
      .replaceAll(" ", "")
      .trim();
  if (result == "FOR ANY QUERY" || result == "FOR ONLINE ORDER") {
    return result;
  }
  return result;
}
