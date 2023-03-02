// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ocr_text_recognition/features/txt_ocr/data/datasource/txt_ocr_datasource.dart';
import 'package:ocr_text_recognition/features/txt_ocr/data/mapper/detector.dart';
import 'package:ocr_text_recognition/features/txt_ocr/data/mapper/txt_data_mapper.dart';

import '../../../../core/error/failures.dart';
import '../models/txt_data_model.dart';

class TxtOcrDataSourceImpl extends TxtOcrDataSource {
  final TextRecognizer textRecognizer;

  TxtOcrDataSourceImpl({required this.textRecognizer});

  @override
  Future<Either<Failures, TxtDataModel>> execute(File fileImage) async {
    final image = InputImage.fromFile(fileImage);
    final visionText = await textRecognizer.processImage(image);

    String nikResult = "";
    String nameFullResult = "";
    String placeOfBirthResult = "";
    String dateOfBirthResult = "";
    String genderResult = "";
    String bloodTypeResult = "";
    String addressFullResult = "";
    String addressResult = "";
    String rtrwResult = "";
    String villageAreaResult = "";
    String subDistrictResult = "";
    String religionResult = "";
    String maritialStatusResult = "";
    String workResult = "";
    String citizenshipResult = "";
    String cardValidityResult = "";
    String companyNameResult = "";
    String emailResult = "";
    String phoneNumberResult = "";
    String purchaseDateResult = "";
    String totalAmountResult = "";

    Rect? nikRect;
    Rect? nameFullRect;
    Rect? placeOfBirthRect;
    Rect? dateOfBirthRect;
    Rect? genderRect;
    Rect? bloodTypeRect;
    Rect? addressFullRect;
    Rect? addressRect;
    Rect? rtrwRect;
    Rect? villageAreaRect;
    Rect? subDistrictRect;
    Rect? religionRect;
    Rect? maritialStatusRect;
    Rect? workRect;
    Rect? citizenshipRect;
    Rect? cardValidityRect;
    Rect? companyNameRect;
    Rect? emailRect;
    Rect? phoneNumberRect;
    Rect? purchaseDateRect;
    Rect? totalAmountRect;

    try {
      for (int i = 0; i < visionText.blocks.length; i++) {
        for (int j = 0; j < visionText.blocks[i].lines.length; j++) {
          for (int k = 0;
              k < visionText.blocks[i].lines[j].elements.length;
              k++) {
            final data = visionText.blocks[i].lines[j].elements[k];

            print("b$i l$j e$k " +
                data.text.toLowerCase().trim().replaceAll(" ", "") +
                " " +
                data.boundingBox.center.toString());

            if (checkNikField(data.text)) {
              nikRect = data.boundingBox;
              print("nik field detected");
            }
            if (checkNameField(data.text)) {
              nameFullRect = data.boundingBox;
              print("nameFull field detected");
            }
            if (checkPlaceOfBirth(data.text)) {
              placeOfBirthRect = data.boundingBox;
              print("placeOfBirth field detected");
            }
            if (checkGenderField(data.text)) {
              genderRect = data.boundingBox;
              print("gender field detected");
            }
            if (checkBloodTypeField(data.text)) {
              bloodTypeRect = data.boundingBox;
              print("bloodType field detected");
            }
            if (checkAddressField(data.text)) {
              addressFullRect = data.boundingBox;
              print("addressFull field detected");
            }
            if (checkRtRwField(data.text)) {
              rtrwRect = data.boundingBox;
              print("rtrw filed detected");
            }
            if (checkVillageField(data.text)) {
              villageAreaRect = data.boundingBox;
              print("villageArea field detected");
            }
            if (checkSubdistrictField(data.text)) {
              subDistrictRect = data.boundingBox;
              print("subDistrict field detected");
            }
            if (checkReligionField(data.text)) {
              religionRect = data.boundingBox;
              print("religion field detected");
            }
            if (checkMaritialStatusField(data.text)) {
              maritialStatusRect = data.boundingBox;
              print("maritialStatus field detcted");
            }
            if (checkWorkField(data.text)) {
              workRect = data.boundingBox;
              print("work field detected");
            }
            if (checkCitizenShipField(data.text)) {
              citizenshipRect = data.boundingBox;
              print("citizenship field dectected");
            }
            if (checkCardValidityField(data.text)) {
              cardValidityRect = data.boundingBox;
              print("cardValidity field detected");
            }
            if (checkCompanyNameField(data.text)) {
              companyNameRect = data.boundingBox;
              print("companyName field detected");
            }
            if (checkEmailField(data.text)) {
              emailRect = data.boundingBox;
              print("email field detected");
            }
            if (checkPhoneNumberField(data.text)) {
              phoneNumberRect = data.boundingBox;
              print("phoneNumber field detected");
            }
            if (checkPurchasedDateField(data.text)) {
              purchaseDateRect = data.boundingBox;
              print("purchaseDate field detected");
            }
            if (checkTotalAmountField(data.text)) {
              totalAmountRect = data.boundingBox;
              print("totalAmount field detected");
            }
          }
        }
      }
    } catch (e) {
      print(e);
      return left(ServerFailure());
    }

    try {
      for (int i = 0; i < visionText.blocks.length; i++) {
        for (int j = 0; j < visionText.blocks[i].lines.length; j++) {
          final data = visionText.blocks[i].lines[j];

          if (isInside(data.boundingBox, nikRect)) {
            nikResult = nikResult + " " + data.text;
            print("------ nik");
            print(nikResult);
          }
          if (isInside3rect(
            isThisRect: data.boundingBox,
            isInside: nameFullRect,
            andAbove: placeOfBirthRect,
          )) {
            if (data.text.toLowerCase() != "name") {
              print("------ name");
              nameFullResult = (nameFullResult + " " + data.text).trim();
              print(nameFullResult);
            }
          }
          if (isInside(data.boundingBox, placeOfBirthRect)) {
            final temp = data.text.replaceAll("Date/Place of Birth", "");
            placeOfBirthResult = temp.substring(0, temp.indexOf(",") + 1);
            print("------ place of birth");
            print(placeOfBirthResult);
          }

          if (isInside(data.boundingBox, placeOfBirthRect)) {
            final temp = data.text.replaceAll("Date/Place of Birth", "");
            final result = temp.substring(0, temp.indexOf(",") + 1);
            print(result);
            if (result.isNotEmpty) {
              placeOfBirthResult =
                  temp.replaceAll(result, "").replaceAll(":", "").trim();
            }
            print("------ date of birth");
            print(dateOfBirthResult);
          }

          if (isInside(data.boundingBox, genderRect)) {
            genderResult = genderResult + "" + data.text;
            print("------ gender");
            print(rtrwResult);
          }

          if (isInside3rect(
            isThisRect: data.boundingBox,
            isInside: addressRect,
            andAbove: religionRect,
          )) {
            addressFullResult = addressFullResult + "" + data.text;
            print("------ address");
            print(addressFullResult);
          }
          if (isInside(data.boundingBox, addressRect)) {
            addressResult = addressResult + "" + data.text;
            print("------ address ");
            print(addressResult);
          }

          if (isInside(data.boundingBox, rtrwRect)) {
            rtrwResult = rtrwResult + "" + data.text;
            print("------ rt rw ");
            print(rtrwResult);
          }

          if (isInside(data.boundingBox, villageAreaRect)) {
            villageAreaResult = villageAreaResult + "" + data.text;
            print("------ village area");
            print(villageAreaResult);
          }

          if (isInside(data.boundingBox, subDistrictRect)) {
            subDistrictResult = subDistrictResult + "" + data.text;
            print("------ sub-district");
            print(subDistrictResult);
          }

          if (isInside(data.boundingBox, religionRect)) {
            religionResult = religionResult + "" + data.text;
            print("------ religion : $religionResult");
          }

          if (isInside(data.boundingBox, maritialStatusRect)) {
            maritialStatusResult = maritialStatusResult + "" + data.text;
            print("------ marritial status");
            print(maritialStatusResult);
          }

          if (isInside(data.boundingBox, workRect)) {
            workResult = workResult + "" + data.text;
            print("------ working status");
            print(workResult);
          }

          if (isInside(data.boundingBox, citizenshipRect)) {
            citizenshipResult = citizenshipResult + "" + data.text;
            print("------ citizenship status");
            print(citizenshipResult);
          }
          if (isInside(data.boundingBox, cardValidityRect)) {
            cardValidityResult = cardValidityResult + "" + data.text;
            print("------ card valifity");
            print(cardValidityResult);
          }

          if (isInside(data.boundingBox, companyNameRect)) {
            companyNameResult = companyNameResult + "" + data.text;
            print("------ company name");
            print(companyNameResult);
          }

          if (isInside(data.boundingBox, emailRect)) {
            emailResult = emailResult + "" + data.text;
            print("------ email address");
            print(emailResult);
          }

          if (isInside(data.boundingBox, phoneNumberRect)) {
            phoneNumberResult = phoneNumberResult + "" + data.text;
            print("------ phone number");
            print(phoneNumberResult);
          }

          if (isInside(data.boundingBox, purchaseDateRect)) {
            purchaseDateResult = purchaseDateResult + "" + data.text;
            print("------ purchase data");
            print(purchaseDateResult);
          }

          if (isInside(data.boundingBox, totalAmountRect)) {
            totalAmountResult = totalAmountResult + "" + data.text;
            print("------ total amount");
            print(totalAmountResult);
          }
        }
      }
    } catch (e) {
      print(e);
      throw Exception("iteration failed");
    }

    final result = TxtDataEntityMapper.from(
      nik: nikResult,
      nameFull: nameFullResult,
      placeOfBirth: placeOfBirthResult,
      dateOfBirth: dateOfBirthResult,
      gender: genderResult,
      bloodType: bloodTypeResult,
      addressFull: addressFullResult,
      address: addressResult,
      rtrw: rtrwResult,
      villageArea: villageAreaResult,
      subDistrict: subDistrictResult,
      religion: religionResult,
      maritialStatus: maritialStatusResult,
      work: workResult,
      citizenship: citizenshipResult,
      cardValidity: cardValidityResult,
      companyName: companyNameResult,
      email: emailResult,
      phoneNumber: phoneNumberResult,
      purchaseDate: purchaseDateResult,
      totalAmount: totalAmountResult,
    );
    return right(result);
  }
}
