class LevelTwo {
  LevelTwo({
      this.type, 
      this.productId, 
      this.changes, 
      this.time,});

  LevelTwo.fromJson(Map json) {
    type = json['type'];
    productId = json['product_id'];
    changes = json['changes'];
    time = json['time'];
  }
  String? type;
  String? productId;
  List? changes;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['product_id'] = productId;
    map['changes'] = changes;
    map['time'] = time;
    return map;
  }

  @override
  String toString() {
    return 'LevelTwo{type: $type, productId: $productId, changes: $changes, time: $time}';
  }
}