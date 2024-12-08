```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Correctly handle the response here
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Handle error here, throw an exception for non-200 status codes
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle the exception
    print('Error fetching data: $e');
    // Rethrow the exception to be handled higher up the call stack
    rethrow; 
  }
}
```