class DeliveryServiceModel{
  final String id;
  final String estimated;
  final String icon;
  final int price;
  final String service;

  const DeliveryServiceModel({
    required this.id,
    required this.estimated,
    required this.icon,
    required this.price,
    required this.service,
  });

  @override
  String toString() {
    return 'DeliveryServiceModel{ '
        'id: $id, '
        'estimated: $estimated, '
        'icon: $icon, '
        'price: $price, '
        'service: $service,'
        '}';
  }

  DeliveryServiceModel copyWith({
    String? id,
    String? estimated,
    String? icon,
    int? price,
    String? service,
  }) {
    return DeliveryServiceModel(
      id: id ?? this.id,
      estimated: estimated ?? this.estimated,
      icon: icon ?? this.icon,
      price: price ?? this.price,
      service: service ?? this.service,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'estimated': estimated,
      'icon': icon,
      'price': price,
      'service': service,
    };
  }

  factory DeliveryServiceModel.fromMap(Map<String, dynamic> map) {
    return DeliveryServiceModel(
      id: map['id'] as String,
      estimated: map['estimated'] as String,
      icon: map['icon'] as String,
      price: map['price'] as int,
      service: map['service'] as String,
    );
  }

//</editor-fold>
}