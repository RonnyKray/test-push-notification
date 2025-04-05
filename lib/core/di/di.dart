part of 'di_part.dart';

typedef DI = DependencyContainer;

class DependencyContainer {
  DependencyContainer();

  static NotificationService get notificationService =>
      get<NotificationService>();

  Future<void> init() async {
    await Future.wait(
      [
        getItSetup(),
      ],
    );
  }

  Future<void> dispose() async {
    await GetIt.I.reset();
  }

  Future<void> getItSetup() async {
    final getIt = GetIt.I;

    final notificationInstance = NotificationService()..initialize();

    getIt.registerSingleton<NotificationService>(
      notificationInstance,
    );
  }
}
