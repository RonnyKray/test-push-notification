part of 'runner.dart';

abstract class Runner {
  Future<void> run() async {
    await runApplication();
  }

  @protected
  Future<void> runApplication();
}

class AppRunner extends Runner {
  @override
  Future<void> runApplication() async {
    try {
      runApp(
        App(),
      );
    } on Object catch (e, _) {
      rethrow;
    }
  }
}
