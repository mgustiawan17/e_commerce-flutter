import 'data.dart';

class CartByIdResponse {
  Data? data;
  int? status;
  String? error;
  String? message;

  CartByIdResponse({this.data, this.status, this.error, this.message});

  factory CartByIdResponse.fromJson(Map<String, dynamic> json) {
    return CartByIdResponse(
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
