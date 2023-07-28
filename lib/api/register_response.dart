class RegisterResponse {
  bool? data;
  int? status;
  String? error;
  String? message;

  RegisterResponse({this.data, this.status, this.error, this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      data: json['data'] as bool?,
      status: json['status'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data,
        'status': status,
        'error': error,
        'message': message,
      };
}
