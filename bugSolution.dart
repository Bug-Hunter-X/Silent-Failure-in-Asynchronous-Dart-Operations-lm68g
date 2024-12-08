```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process jsonData
    } else {
      // Specific error handling for non-200 status codes
      throw HttpException('HTTP error! Status code: ${response.statusCode}, Body: ${response.body}');
    }
  } on SocketException catch (e) {
    // Handle network errors specifically
    print('Network error: $e');
    throw Exception('Failed to connect to the server.');
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON decoding error: $e');
    throw Exception('Invalid JSON format in response.');
  } on Exception catch (e) {
    print('An unexpected error occurred: $e');
    rethrow; // Re-throw to let the caller handle this
  } catch (e) {
    print('Unknown error: $e');
    rethrow; // Re-throw unknown error for higher up handling
  }
}
```