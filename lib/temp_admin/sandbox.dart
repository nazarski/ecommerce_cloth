import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authControllerProvider =
//     StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
//   return AuthController(ref);
// });
//
// class AuthController extends StateNotifier<AsyncValue<void>> {
//   AuthController(this.ref) : super(const AsyncValue.data(null));
//   final Ref ref;
//
//   Future<void> signInAnonymously() async {
//     state = const AsyncValue.loading();
//     await Future.delayed(const Duration(seconds: 3));
//     state = const AsyncValue.data(null);
//   }
// }
//
final authControllerProvider = AsyncNotifierProvider<AuthController, void>(() {
  return AuthController();
});

class AuthController extends AsyncNotifier<void> {
  Future<void> signInAnonymously(String data) async {
    try {
      state = AsyncValue.loading();
      await Future.delayed(const Duration(seconds: 3));
      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  @override
  FutureOr<void> build() {}
}

