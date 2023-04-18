import 'package:ecommerce_cloth/data/repositories/manage_favourites_repository_impl.dart';
import 'package:ecommerce_cloth/domain/use_cases/manage_favourites/manage_favourites.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ManageFavourites _favourites =
    ManageFavourites(ManageFavouritesRepositoryImpl());

final favouritesTypesProvider =
    AutoDisposeFutureProviderFamily<List<String>, int>((ref, arg) async {
  return ['Summer', 'T-shirts', 'Shirts', 'Tops'];

    // await _favourites.getFavouritesTypes(userId: arg);
});



