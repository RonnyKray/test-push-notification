part of '../home_part.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) =>
            previous.currentFCMToken != current.currentFCMToken,
        builder: (context, state) {
          return Center(
            child: Text(
              'Current FCM Token: ${state.currentFCMToken}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
