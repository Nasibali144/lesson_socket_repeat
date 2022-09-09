import 'dart:convert';

Heartbeat heartbeatFromJson(String str) => Heartbeat.fromJson(json.decode(str));
String heartbeatToJson(Heartbeat data) => json.encode(data.toJson());

class Heartbeat {
  Heartbeat({
      this.type, 
      this.lastTradeId, 
      this.productId, 
      this.sequence, 
      this.time,});

  Heartbeat.fromJson(dynamic json) {
    type = json['type'];
    lastTradeId = json['last_trade_id'];
    productId = json['product_id'];
    sequence = json['sequence'];
    time = json['time'];
  }
  String? type;
  num? lastTradeId;
  String? productId;
  num? sequence;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['last_trade_id'] = lastTradeId;
    map['product_id'] = productId;
    map['sequence'] = sequence;
    map['time'] = time;
    return map;
  }

  @override
  String toString() {
    return 'Heartbeat{type: $type, lastTradeId: $lastTradeId, productId: $productId, sequence: $sequence, time: $time}';
  }
}