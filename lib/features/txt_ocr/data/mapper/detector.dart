import 'dart:ui';

bool checkNikField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "nik";
}

bool checkNameField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "name" || dataText.contains("নাম");
}

bool checkPlaceOfBirth(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "birth place" ||
      dataText.contains("জন্মস্থান") ||
      text == "Place of Birth";
}

bool checkGenderField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "man" || text == "women" || dataText.contains("লিঙ্গ");
}

bool checkBloodTypeField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "Blood Group" || text == "blood Type";
}

bool checkAddressField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "address" ||
      text == "full address" ||
      text == "permanent address" ||
      text == "present address" ||
      dataText.contains("ঠিকানা");
}

bool checkRtRwField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "rt/rw" || text == "rw" || text == "rt" || text == "rtirw";
}

bool checkVillageField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "village";
}

bool checkSubdistrictField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "subdistrict" || dataText.contains("উপজেলা");
}

bool checkReligionField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "Islam" ||
      text == "Hindu" ||
      text == "Buddho" ||
      text == "Christian";
}

bool checkMaritialStatusField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "Married" ||
      text == "unmarried" ||
      dataText.contains("বিবাহিত") ||
      dataText.contains("অবিবাহিত");
}

bool checkWorkField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "Work" || dataText.contains("কাজ");
}

bool checkCitizenShipField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == "Banglaeshi" ||
      dataText.contains("বাংলাদেশী") ||
      dataText.contains("প্রবাসী");
}

bool checkCardValidityField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == ":" || text == "";
}

bool checkCompanyNameField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == ":" || text == "";
}

bool checkEmailField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == ":" || text == "";
}

bool checkPhoneNumberField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == ":" || text == "";
}

bool checkPurchasedDateField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == ":" || text == "";
}

bool checkTotalAmountField(String dataText) {
  final text = dataText.toLowerCase().trim();
  return text == ":" || text == "";
}

bool isInside(Rect? rect, Rect? isInside) {
  if (rect == null) {
    return false;
  }
  if (isInside == null) {
    return false;
  }

  if (rect.center.dy <= isInside.bottom &&
      rect.center.dy >= isInside.top &&
      rect.center.dy >= isInside.right &&
      rect.center.dx <= 390) {
    return true;
  }
  return false;
}

bool isInside3rect({Rect? isThisRect, Rect? isInside, Rect? andAbove}) {
  if (isThisRect == null) {
    return false;
  }
  if (isInside == null) {
    return false;
  }
  if (andAbove == null) {
    return false;
  }
  if (isThisRect.center.dy <= andAbove.top &&
      isThisRect.center.dy >= isInside.top &&
      isThisRect.center.dx >= isInside.left) {
    return true;
  }
  return false;
}
