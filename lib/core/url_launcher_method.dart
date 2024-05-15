Future<void> launchUrl(Uri uri) async {
  print('Launching url: $uri');
  print('this does nothing yet in the wasm experiment');
}

Future<bool> canLaunchUrl(Uri uri) async {
  print('Checking if url can be launched: $uri');
  return true;
}
