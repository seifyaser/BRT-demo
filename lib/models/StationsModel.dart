class StationModel {
  final int id;
  final String nameAr;
  final String nameEn;
  final int number;
  final bool isActive;
  final City city;
  final StationType stationType;

  StationModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.number,
    required this.isActive,
    required this.city,
    required this.stationType,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      number: json['number'],
      isActive: json['isActive'],
      city: City.fromJson(json['city']),
      stationType:  StationType.fromJson(json['stationType']),
    );
  }
}

class City {
  final int id;
  final String nameAr;
  final String nameEn;
  final bool isActive;

  City({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.isActive,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      isActive: json['isActive'],
    );
  }
}

class StationType {
  final int id;
  final String nameAr;
  final String nameEn;

  StationType({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory StationType.fromJson(Map<String, dynamic> json) {
    return StationType(
      id: json['id'],
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
    );
  }
}
