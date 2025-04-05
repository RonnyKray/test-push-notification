part of 'runner.dart';

abstract class Runner {
  late DependencyContainer _container;

  Future<void> run() async {
    _container = await initializeContainer();
    await runApplication(_container);
  }

  @protected
  Future<DependencyContainer> initializeContainer();

  @protected
  Future<void> runApplication(DependencyContainer container);
}

class AppRunner extends Runner {
  @override
  Future<DependencyContainer> initializeContainer() async {
    final container = DependencyContainer();
    await container.init();
    return container;
  }

  @override
  Future<void> runApplication(
    DependencyContainer container,
  ) async {
    try {
      runApp(
        App(),
      );
    } on Object catch (e, _) {
      rethrow;
    }
  }
}
