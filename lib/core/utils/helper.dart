String getTitle({
  required String name,
  required String brand,
  required String type,
}) {
  if (name.isEmpty) {
    return brand.length < 13
        ? '$brand $type'
        : '${brand.substring(0, 10)}... $type';
  }
  return name.length < 13
      ? '$name $type'
      : '${name.substring(0, 9)}... $type';
}