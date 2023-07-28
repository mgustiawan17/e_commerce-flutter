import 'data.dart';

class DetailProductResponse {
  Data? data;
  int? status;
  String? error;
  String? message;

  DetailProductResponse({this.data, this.status, this.error, this.message});

  factory DetailProductResponse.fromJson(Map<String, dynamic> json) {
    return DetailProductResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'status': status,
        'error': error,
        'message': message,
      };
}
