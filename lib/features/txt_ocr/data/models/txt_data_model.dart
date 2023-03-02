import '../../domain/entity/txt_data_entity.dart';

class TxtDataModel extends TxtDataEnity {
  const TxtDataModel({
    required String? nik, // nik
    required String? nameFull, // namaLengkap
    required String? placeOfBirth, // tempatLahir
    required String? dateOfBirth, // tanggalLahir
    required String? gender, // jenisKelamin
    required String? bloodType, // golDarah
    required String? addressFull, // alamatFull
    required String? address, // alamat
    required String? rtrw, //  rtrw
    required String? villageArea, // kelDesa
    required String? subDistrict, // kecamatan
    required String? religion, // agama
    required String? maritialStatus, // statusPerkawinan
    required String? work, // pekerjaan
    required String? citizenship, // kewarganegaraan
    required String? cardValidity, // berlakuHingga
    required String? companyName,
    required String? email,
    required String? phoneNumber,
    required String? purchaseDate,
    required String? totalAmount,
  }) : super();
  factory TxtDataModel.fromJson(Map<String, dynamic> json) => TxtDataModel(
        nik: json["nik"],
        nameFull: json["name_full"],
        placeOfBirth: json["place_of_birth"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        bloodType: json["blood_type"],
        addressFull: json["address_full"],
        address: json["address"],
        rtrw: json["rtrw"],
        villageArea: json["village_area"],
        subDistrict: json["sub_district"],
        religion: json["religion"],
        maritialStatus: json["maritial_status"],
        work: json["work"],
        citizenship: json["citizenship"],
        cardValidity: json["card_validity"],
        companyName: json["company_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        purchaseDate: json["purchase_date"],
        totalAmount: json["total_amount"],
      );
  Map<String, dynamic> toJson() => {
        "nik": nik,
        "name_full": nameFull,
        "place_of_birth": placeOfBirth,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "blood_type": bloodType,
        "address_full": addressFull,
        "address": address,
        "rtrw": rtrw,
        "village_area": villageArea,
        "sub_district": subDistrict,
        "religion": religion,
        "maritial_status": maritialStatus,
        "work": work,
        "citizenship": citizenship,
        "card_validity": cardValidity,
      };
}
