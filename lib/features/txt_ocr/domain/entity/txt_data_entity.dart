import 'package:equatable/equatable.dart';

class TxtDataEnity extends Equatable {
  final String? nik;
  final String? nameFull;
  final String? placeOfBirth;
  final String? dateOfBirth;
  final String? gender;
  final String? bloodType;
  final String? addressFull;
  final String? address;
  final String? rtrw;
  final String? villageArea;
  final String? subDistrict;
  final String? religion;
  final String? maritialStatus;
  final String? work;
  final String? citizenship;
  final String? cardValidity;
  final String? companyName;
  final String? email;
  final String? phoneNumber;
  final String? purchaseDate;
  final String? totalAmount;

  const TxtDataEnity({
    this.nik,
    this.nameFull,
    this.placeOfBirth,
    this.dateOfBirth,
    this.gender,
    this.bloodType,
    this.addressFull,
    this.address,
    this.rtrw,
    this.villageArea,
    this.subDistrict,
    this.religion,
    this.maritialStatus,
    this.work,
    this.citizenship,
    this.cardValidity,
    this.companyName,
    this.email,
    this.phoneNumber,
    this.purchaseDate,
    this.totalAmount,
  });

  @override
  List<Object?> get props => [
        nik,
        nameFull,
        placeOfBirth,
        dateOfBirth,
        gender,
        bloodType,
        addressFull,
        address,
        rtrw,
        villageArea,
        subDistrict,
        religion,
        maritialStatus,
        work,
        citizenship,
        cardValidity,
        companyName,
        email,
        phoneNumber,
        purchaseDate,
        totalAmount,
      ];
}
