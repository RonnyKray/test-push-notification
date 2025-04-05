part of 'main_bloc_part.dart';

@freezed
class MainState with _$MainState {
  const MainState._();

  const factory MainState.loaded({
    @Default(false) bool isLoading,
    @Default(false) bool isLoaded,
    String? currentFCMToken,
  }) = _MainState;
}
