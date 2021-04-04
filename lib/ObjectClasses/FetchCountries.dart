// To parse this JSON data, do
//
//     final fetchCountries = fetchCountriesFromJson(jsonString);

import 'dart:convert';

List<FetchCountries> fetchCountriesFromJson(String str) => List<FetchCountries>.from(json.decode(str).map((x) => FetchCountries.fromJson(x)));

String fetchCountriesToJson(List<FetchCountries> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchCountries {
  FetchCountries({
    this.cId,
    this.cName,
    this.cImage,
    this.cNotes,
    this.cRequirements,
    this.cDurations,
    this.cFaqs,
  });

  String cId;
  String cName;
  String cImage;
  String cNotes;
  List<CRequirement> cRequirements;
  List<CDuration> cDurations;
  List<CFaq> cFaqs;

  factory FetchCountries.fromJson(Map<String, dynamic> json) => FetchCountries(
    cId: json["c_id"],
    cName: json["c_name"],
    cImage: json["c_image"],
    cNotes: json["c_notes"],
    cRequirements: List<CRequirement>.from(json["c_requirements"].map((x) => CRequirement.fromJson(x))),
    cDurations: List<CDuration>.from(json["c_durations"].map((x) => CDuration.fromJson(x))),
    cFaqs: List<CFaq>.from(json["c_faqs"].map((x) => CFaq.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "c_id": cId,
    "c_name": cName,
    "c_image": cImage,
    "c_notes": cNotes,
    "c_requirements": List<dynamic>.from(cRequirements.map((x) => x.toJson())),
    "c_durations": List<dynamic>.from(cDurations.map((x) => x.toJson())),
    "c_faqs": List<dynamic>.from(cFaqs.map((x) => x.toJson())),
  };
}

class CDuration {
  CDuration({
    this.vdId,
    this.vdDuration,
    this.vdCurrency,
    this.vdSinglePrice,
    this.vdMultiPrice,
  });

  String vdId;
  VdDuration vdDuration;
  VdCurrency vdCurrency;
  String vdSinglePrice;
  String vdMultiPrice;

  factory CDuration.fromJson(Map<String, dynamic> json) => CDuration(
    vdId: json["vd_id"],
    vdDuration: vdDurationValues.map[json["vd_duration"]],
    vdCurrency: vdCurrencyValues.map[json["vd_currency"]],
    vdSinglePrice: json["vd_single_price"],
    vdMultiPrice: json["vd_multi_price"],
  );

  Map<String, dynamic> toJson() => {
    "vd_id": vdId,
    "vd_duration": vdDurationValues.reverse[vdDuration],
    "vd_currency": vdCurrencyValues.reverse[vdCurrency],
    "vd_single_price": vdSinglePrice,
    "vd_multi_price": vdMultiPrice,
  };
}

enum VdCurrency { RS }

final vdCurrencyValues = EnumValues({
  "RS": VdCurrency.RS
});

enum VdDuration { THE_7_MONTH, THE_15_DAYS, THE_14_MONTH }

final vdDurationValues = EnumValues({
  "14 Month": VdDuration.THE_14_MONTH,
  "15 Days": VdDuration.THE_15_DAYS,
  "7 Month": VdDuration.THE_7_MONTH
});

class CFaq {
  CFaq({
    this.vfId,
    this.vfQuestion,
    this.vfAnswer,
  });

  String vfId;
  VfQuestion vfQuestion;
  String vfAnswer;

  factory CFaq.fromJson(Map<String, dynamic> json) => CFaq(
    vfId: json["vf_id"],
    vfQuestion: vfQuestionValues.map[json["vf_question"]],
    vfAnswer: json["vf_answer"],
  );

  Map<String, dynamic> toJson() => {
    "vf_id": vfId,
    "vf_question": vfQuestionValues.reverse[vfQuestion],
    "vf_answer": vfAnswer,
  };
}

enum VfQuestion { CAN_I_CANCEL_MY_VISA, HOW_LONG_DOES_IT_TAKE_TO_GET_VISA, DO_YOU_KNOW_ZEESHA_CHUTTU, ZEESHAN_GET_BAMBOO }

final vfQuestionValues = EnumValues({
  "Can I cancel my Visa?": VfQuestion.CAN_I_CANCEL_MY_VISA,
  "Do you Know Zeesha chuttu?": VfQuestion.DO_YOU_KNOW_ZEESHA_CHUTTU,
  "How long does it take to get visa?": VfQuestion.HOW_LONG_DOES_IT_TAKE_TO_GET_VISA,
  "Zeeshan get Bamboo": VfQuestion.ZEESHAN_GET_BAMBOO
});

class CRequirement {
  CRequirement({
    this.requirements,
    this.rid,
    this.reqUploadSteps,
  });

  String requirements;
  String rid;
  ReqUploadSteps reqUploadSteps;

  factory CRequirement.fromJson(Map<String, dynamic> json) => CRequirement(
    requirements: json["requirements"],
    rid: json["rid"],
    reqUploadSteps: reqUploadStepsValues.map[json["req_upload_steps"]],
  );

  Map<String, dynamic> toJson() => {
    "requirements": requirements,
    "rid": rid,
    "req_upload_steps": reqUploadStepsValues.reverse[reqUploadSteps],
  };
}

enum ReqUploadSteps { GG, EMPTY, DSD }

final reqUploadStepsValues = EnumValues({
  "dsd": ReqUploadSteps.DSD,
  "": ReqUploadSteps.EMPTY,
  "gg": ReqUploadSteps.GG
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
