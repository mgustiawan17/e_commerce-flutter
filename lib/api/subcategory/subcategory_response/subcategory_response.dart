import 'datum.dart';

class SubcategoryResponse {
  List<Datum>? data;
  int? status;
  String? error;
  String? message;

  SubcategoryResponse({this.data, this.status, this.error, this.message});

  factory SubcategoryResponse.fromJson(Map<String, dynamic> json) {
    return SubcategoryResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
        'error': error,
        'message': message,
      };
}
