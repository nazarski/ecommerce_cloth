String getTitle({
  required String name,
  required String brand,
  required String type,
}) {
  if (name.isEmpty) {
    return type;
  }
  return name.length < 13 ? '$name $type' : '${name.substring(0, 9)}... $type';
}

String getChipValue(DateTime additionDate, Map<String, dynamic> sale) {
  final now = DateTime.now();
  if (now.difference(additionDate).inDays <= 7) {
    return 'new';
  }
  if (sale.isNotEmpty) {
    return sale['discountValue'].toString();
  }
  return '';
}
