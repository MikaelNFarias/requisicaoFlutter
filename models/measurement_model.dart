import 'dart:convert';

Measurements measurementsFromMap(String str) => Measurements.fromMap(json.decode(str));

String measurementsToMap(Measurements data) => json.encode(data.toMap());

class Measurements {
  final double chestCircumference;
  final double waistCircumference;
  final double hipCircumference;

  Measurements({
    required this.chestCircumference,
    required this.waistCircumference,
    required this.hipCircumference,
  });

  factory Measurements.fromMap(Map<String, dynamic> json) => Measurements(
        chestCircumference: (json["chest_circumference"] ?? 0.0).toDouble(),
        waistCircumference: (json["waist_circumference"] ?? 0.0).toDouble(),
        hipCircumference: (json["hip_circumference"] ?? 0.0).toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "chest_circumference": chestCircumference,
        "waist_circumference": waistCircumference,
        "hip_circumference": hipCircumference,
      };

  @override
  String toString() {
    return 'Measurements(chestCircumference: $chestCircumference, waistCircumference: $waistCircumference, hipCircumference: $hipCircumference)';
  }
}
