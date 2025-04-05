part of 'main_bloc_part.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required NotificationService notificationService,
  })  : _notificationService = notificationService,
        super(const _MainState()) {
    on<MainEvent>(
      (event, emit) => switch (event) {
        _Initial() => _initial(event, emit),
        MainEvent() => () {},
      },
    );
  }

  final NotificationService _notificationService;

  Future<void> _initial(
    _Initial event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final currentToken = _notificationService.currentToken;
    emit(state.copyWith(
      isLoading: false,
      currentFCMToken: currentToken,
      isLoaded: true,
    ));
  }
}

extension MainBlocBuildContextX on BuildContext {
  MainBloc get mainBloc => read<MainBloc>();
  MainBloc get watchMainBloc => watch<MainBloc>();
}
