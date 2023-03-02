// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'package:ocr_text_recognition/core/constant/constant_helper.dart';

import '../../data/models/txt_data_model.dart';

class DetailTextRecognition extends StatelessWidget {
  final TxtDataModel _txtDataModel;
  const DetailTextRecognition({super.key, required TxtDataModel txtDataModel})
      : _txtDataModel = txtDataModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController nikController = TextEditingController();
    TextEditingController nameFullController = TextEditingController();
    TextEditingController placeOfBirthController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController bloodTypeController = TextEditingController();
    TextEditingController addressFullController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController rtrwController = TextEditingController();
    TextEditingController villageAreaController = TextEditingController();
    TextEditingController subDistrictController = TextEditingController();
    TextEditingController religionController = TextEditingController();
    TextEditingController maritialStatusController = TextEditingController();
    TextEditingController workController = TextEditingController();
    TextEditingController citizenshipController = TextEditingController();
    TextEditingController cardValidityController = TextEditingController();
    TextEditingController companyNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController purchaseDateController = TextEditingController();
    TextEditingController totalAmountController = TextEditingController();

    void modelToTextEditing() {
      nikController.text = _txtDataModel.nik ?? "";
      nameFullController.text = _txtDataModel.nameFull ?? "";
      placeOfBirthController.text = _txtDataModel.placeOfBirth ?? "";
      dateOfBirthController.text = _txtDataModel.dateOfBirth ?? "";
      genderController.text = _txtDataModel.gender ?? "";
      bloodTypeController.text = _txtDataModel.bloodType ?? "";
      addressFullController.text = _txtDataModel.addressFull ?? "";
      addressController.text = _txtDataModel.address ?? "";
      rtrwController.text = _txtDataModel.rtrw ?? "";
      religionController.text = _txtDataModel.religion ?? "";
      maritialStatusController.text = _txtDataModel.maritialStatus ?? "";
      workController.text = _txtDataModel.work ?? "";
      citizenshipController.text = _txtDataModel.citizenship ?? "";
      cardValidityController.text = _txtDataModel.cardValidity ?? "";
      companyNameController.text = _txtDataModel.companyName ?? "";
      emailController.text = _txtDataModel.email ?? "";
      phoneNumberController.text = _txtDataModel.phoneNumber ?? "";
      purchaseDateController.text = _txtDataModel.purchaseDate ?? "";
      totalAmountController.text = _txtDataModel.totalAmount ?? "";
    }

    modelToTextEditing();

    Widget inputText(TextEditingController controller, String label) {
      return Container(
        margin: const EdgeInsets.only(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.person_pin,
                      color: primaryColor,
                      size: 25,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {},
                        controller: controller,
                        style: TextStyle(color: blackColor),
                        decoration: InputDecoration.collapsed(
                          hintText: label,
                          hintStyle: TextStyle(color: darkGreyColor),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Text Recognition"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  inputText(nikController, "Nik"),
                  inputText(nameFullController, "Name Full"),
                  inputText(placeOfBirthController, "Place of Birth"),
                  inputText(dateOfBirthController, "Date of Birth"),
                  inputText(genderController, "Gender"),
                  inputText(bloodTypeController, "Blood Type"),
                  inputText(addressFullController, "Address Full"),
                  inputText(addressController, "Address"),
                  inputText(rtrwController, "RT/Rw"),
                  inputText(villageAreaController, "Village Name"),
                  inputText(subDistrictController, "Sub-District"),
                  inputText(religionController, "Religion"),
                  inputText(maritialStatusController, "Married Status"),
                  inputText(workController, "Work"),
                  inputText(citizenshipController, "Citizenship"),
                  inputText(cardValidityController, "Card Validity"),
                  inputText(companyNameController, "Company Name"),
                  inputText(emailController, "Email"),
                  inputText(phoneNumberController, "Phone Number"),
                  inputText(purchaseDateController, "Purchase date"),
                  inputText(totalAmountController, "Total Amount"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
