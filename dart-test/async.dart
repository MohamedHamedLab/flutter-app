// Asynchronous Programming
void main() async {
  String data = await fetchData();
  print("Data received: " + data);
  String anotherData = await fetchAnotherData();
  print("Data received: " + anotherData);
}

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 3));
  return "data from server";
}

Future<String> fetchAnotherData() async {
  await Future.delayed(Duration(seconds: 2));
  return "another data from server";
}
