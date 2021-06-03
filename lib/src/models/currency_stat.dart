class CurrencyStat {
  CurrencyStat({
    this.symbol,
    this.name,
    this.symbolNative,
    this.decimalDigits,
    this.rounding,
    this.code,
    this.namePlural,
  });

  String? symbol;
  String? name;
  String? symbolNative;
  int? decimalDigits;
  double? rounding;
  String? code;
  String? namePlural;

  factory CurrencyStat.fromJson(Map<String, dynamic> json) {
    return CurrencyStat(
      symbol: json["symbol"],
      name: json["name"],
      symbolNative: json["symbol_native"],
      decimalDigits: json["decimal_digits"],
      rounding: json["rounding"] != null ? json["rounding"].toDouble() : 0,
      code: json["code"],
      namePlural: json["name_plural"],
    );
  }

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "name": name,
        "symbol_native": symbolNative,
        "decimal_digits": decimalDigits,
        "rounding": rounding,
        "code": code,
        "name_plural": namePlural,
      };
}
