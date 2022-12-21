class Laundry {
  Laundry({
    this.id,
    this.weight,
    this.price,
    this.status,
    this.queueDate,
    this.date,
    this.startDate,
    this.endDate,
    this.customerName,
  });

  String? id;
  double? weight;
  double? price;
  String? status;
  DateTime? queueDate;
  String? date;
  DateTime? startDate;
  DateTime? endDate;
  String? customerName;

  factory Laundry.fromJson(Map<String, dynamic> json) => Laundry(
        id: json["id"],
        weight: json["weight"].toDouble(),
        price: json["price"].toDouble(),
        status: json["status"],
        queueDate: DateTime.fromMicrosecondsSinceEpoch(json["queue_date"]),
        date: json["date"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.fromMicrosecondsSinceEpoch(json["start_date"]),
        endDate: json["end_date"] == null
            ? null
            : DateTime.fromMicrosecondsSinceEpoch(json["end_date"]),
        customerName: json['customer_name'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "price": price,
        "status": status,
        "date": date,
        "queue_date": queueDate!.microsecondsSinceEpoch,
        "start_date":
            startDate == null ? null : startDate!.microsecondsSinceEpoch,
        "end_date": startDate == null ? null : endDate!.microsecondsSinceEpoch,
        "customer_name": customerName,
      };
}
