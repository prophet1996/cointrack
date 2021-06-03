import 'package:cointrack/src/models/crypto_currency.dart';
import 'package:cointrack/src/models/currency_stat.dart';

class ApiResponse<T> {
  Status? status;
  List<T>? data;

  ApiResponse(this.status, this.data);

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    data = json["data"] != null
        ? List<T>.from(
            json["data"].map(
              (x) {
                if (T.toString() == 'CryptoCurrency') {
                  return CryptoCurrency.fromJson(x);
                } else if (T.toString() == "CurrencyStat") {
                  return CurrencyStat.fromJson(x);
                }
              },
            ),
          )
        : null;
  }
}

class Status {
  String? timestamp;
  int? errorCode;
  String? errorMessage;
  int? elapsed;
  int? creditCount;
  String? notice;
  int? totalCount;

  Status(this.timestamp, this.errorCode, this.errorMessage, this.elapsed,
      this.creditCount, this.notice, this.totalCount);

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
    notice = json['notice'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    data['notice'] = notice;
    data['total_count'] = totalCount;
    return data;
  }
}
