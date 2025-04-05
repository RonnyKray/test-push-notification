extension IntExt on int {
  String get lostSeconds {
    final hours = this ~/ 60;
    final minutes = this % 60;

    final formattedHours = hours.toString().padLeft(2, '0');
    final formattedMinutes = minutes.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes';
  }
}
