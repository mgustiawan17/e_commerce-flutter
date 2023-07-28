class UpdateCartResponse {
  int? rows;
  int? status;
  String? message;

  UpdateCartResponse({this.rows, this.status, this.message});

  factory UpdateCartResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCartResponse(
      rows: json['rows'] as int?,
      status: json['status'] as int?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'rows': rows,
        'status': status,
        'message': message,
      };
}
