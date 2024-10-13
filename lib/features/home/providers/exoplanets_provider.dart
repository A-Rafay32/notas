import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/app/constants/api_urls.dart';
import 'package:notas/core/services/http_service.dart';
import 'package:notas/features/home/model/exoplanets_collection_model.dart';
import 'package:http/http.dart' as http;

final exoplanetsProvider = FutureProvider((ref) async {
  // Define the base URL without protocol (just the authority part)
  const authority = 'images-api.nasa.gov';

  // Define the path for the API request (omit the initial '/')
  const path = 'search';

  // Define query parameters (if any)
  const queryParams = {'q': 'exoplanet'};

  // Make the HTTP request using Uri.https
  final response = await http.get(Uri.https(authority, path, queryParams));

  // Parse the JSON response
  final json = jsonDecode(response.body) as Map<String, dynamic>;

  // Return the parsed data as a NasaCollection object
  return NasaCollection.fromMap(json);
});
