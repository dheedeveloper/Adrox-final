// To parse this JSON data, do
//
//     final homeScreenModel = homeScreenModelFromJson(jsonString);

import 'dart:convert';

HomeScreenModel homeScreenModelFromJson(String str) => HomeScreenModel.fromJson(json.decode(str));

String homeScreenModelToJson(HomeScreenModel data) => json.encode(data.toJson());

class HomeScreenModel {
  String? status;
  String? message;
  Data? data;

  HomeScreenModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeScreenModel.fromJson(Map<String, dynamic> json) => HomeScreenModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Banner>? banner;
  List<Link>? links;
  List<CoinList>? coinList;

  Data({
    this.banner,
    this.links,
    this.coinList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banner: json["banner"] == null ? [] : List<Banner>.from(json["banner"]!.map((x) => Banner.fromJson(x))),
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    coinList: json["coin_list"] == null ? [] : List<CoinList>.from(json["coin_list"]!.map((x) => CoinList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": banner == null ? [] : List<dynamic>.from(banner!.map((x) => x.toJson())),
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "coin_list": coinList == null ? [] : List<dynamic>.from(coinList!.map((x) => x.toJson())),
  };
}

class Banner {
  String? img;
  String? alt;
  String? link;

  Banner({
    this.img,
    this.alt,
    this.link,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    img: json["img"],
    alt: json["alt"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "alt": alt,
    "link": link,
  };
}

class CoinList {
  String? name;
  String? symbol;
  String? simpleswapSymbol;
  Network? network;
  String? image;
  String? contractAddress;
  String? price;
  double? change1H;
  bool? changeValue;

  CoinList({
    this.name,
    this.symbol,
    this.simpleswapSymbol,
    this.network,
    this.image,
    this.contractAddress,
    this.price,
    this.change1H,
    this.changeValue,
  });

  factory CoinList.fromJson(Map<String, dynamic> json) => CoinList(
    name: json["name"],
    symbol: json["symbol"],
    simpleswapSymbol: json["simpleswapSymbol"],
    network: networkValues.map[json["network"]]!,
    image: json["image"],
    contractAddress: json["contract_address"],
    price: json["price"],
    change1H: json["change_1h"]?.toDouble(),
    changeValue: json["change_value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
    "simpleswapSymbol": simpleswapSymbol,
    "network": networkValues.reverse[network],
    "image": image,
    "contract_address": contractAddress,
    "price": price,
    "change_1h": change1H,
    "change_value": changeValue,
  };
}

enum Network {
  BSC,
  ETH,
  TRX
}

final networkValues = EnumValues({
  "bsc": Network.BSC,
  "eth": Network.ETH,
  "trx": Network.TRX
});

class Link {
  String? name;
  String? url;

  Link({
    this.name,
    this.url,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
