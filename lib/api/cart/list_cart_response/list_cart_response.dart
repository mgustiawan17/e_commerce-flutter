import 'datum.dart';

class ListCartResponse {
  List<Datum>? data;
  int? status;
  String? error;
  String? message;

  ListCartResponse({this.data, this.status, this.error, this.message});

  factory ListCartResponse.fromJson(Map<String, dynamic> json) {
    return ListCartResponse(
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
