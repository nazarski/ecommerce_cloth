Map<String, String> generateProductTypesQuery(List<String> types) {
  return {
    for (int i = 0; i < types.length; i++)
      'filters[productType][typeName][$i]': types[i]
  };
}

Map<String, String> generateSizesQuery(List<String> sizes) {
  return {
    for (int i = 0; i < sizes.length; i++)
      'filters[availableQuantity][size][$i]': sizes[i]
  };
}
Map<String, String> generateColorsQuery(List<String> colors) {
  return {
    for (int i = 0; i < colors.length; i++)
      'filters[color][$i]': colors[i]
  };
}
Map<String, String> generateBrandNameQuery(List<String> brandNames) {
  return {
    for (int i = 0; i < brandNames.length; i++)
      'filters[brand][brandName][$i]': brandNames[i]
  };
}
Map<String, int> generatePriceQuery(int fromPrice, int toPrice) {
  return {
    'filters[price][\$lte]': toPrice,
    'filters[price][\$gte]': fromPrice,
  };
}
