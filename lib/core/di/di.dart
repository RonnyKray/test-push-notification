part of 'di_part.dart';

typedef DI = DependencyContainer;

class DependencyContainer {
  DependencyContainer();

  static NotificationService get notificationService =>
      get<NotificationService>();

  Future<void> init() async {
    await Future.wait(
      [notificationService.initialize()],
    );
  }

  Future<void> dispose() async {
    await GetIt.I.reset();
  }
}
