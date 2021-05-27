import 'package:cointrack/src/models/api_response.dart';

class CryptoCurrency {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? numMarketPairs;
  String? dateAdded;
  List<String>? tags;
  num? maxSupply;
  num? circulatingSupply;
  num? totalSupply;
  Platform? platform;
  int? cmcRank;
  String? lastUpdated;
  Quote? quote;

  CryptoCurrency(
      this.id,
      this.name,
      this.symbol,
      this.slug,
      this.numMarketPairs,
      this.dateAdded,
      this.tags,
      maxSupply,
      circulatingSupply,
      totalSupply,
      this.platform,
      this.cmcRank,
      this.lastUpdated,
      this.quote) {
    this.name = name;
    this.symbol = symbol;
    this.slug = slug;
    this.numMarketPairs = numMarketPairs;
    this.dateAdded = dateAdded;
    this.tags = tags;
    this.maxSupply = maxSupply.toDouble();
    this.circulatingSupply = circulatingSupply.toDouble();
    this.totalSupply = totalSupply.toDouble();
    this.platform = platform;
    this.cmcRank = cmcRank;
    this.lastUpdated = lastUpdated;
    this.quote = quote;
  }

  CryptoCurrency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    maxSupply = json['max_supply'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    platform =
        json['platform'] != null ? Platform.fromJson(json['platform']) : null;
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['num_market_pairs'] = numMarketPairs;
    data['date_added'] = dateAdded;
    data['tags'] = tags;
    data['max_supply'] = maxSupply;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['platform'] = platform?.toJson();
    data['cmc_rank'] = cmcRank;
    data['last_updated'] = lastUpdated;
    data['quote'] = quote?.toJson();
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  String? tokenAddress;

  Platform(this.id, this.name, this.symbol, this.slug, this.tokenAddress);

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    tokenAddress = json['token_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['token_address'] = tokenAddress;
    return data;
  }
}

class Quote {
  USD? uSD;

  Quote(this.uSD);

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['USD'] = uSD?.toJson();
    return data;
  }
}

class USD {
  num? price;
  num? volume24h;
  num? percentChange1h;
  num? percentChange24h;
  num? percentChange7d;
  num? percentChange30d;
  num? percentChange60d;
  num? percentChange90d;
  num? marketCap;
  String? lastUpdated;

  USD(
      this.price,
      this.volume24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.percentChange30d,
      this.percentChange60d,
      this.percentChange90d,
      this.marketCap,
      this.lastUpdated);

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['percent_change_30d'] = percentChange30d;
    data['percent_change_60d'] = percentChange60d;
    data['percent_change_90d'] = percentChange90d;
    data['market_cap'] = marketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
