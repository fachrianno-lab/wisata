import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/wisata.dart';

class WisataController {

  Future<List<Wisata>> getDaftarWisata() async {

    try {
      final String response = await rootBundle.loadString(
        'assets/data/wisata.json',
      );

      final List<dynamic> data = jsonDecode(response);

      return data.map((item) {
        return Wisata.fromJson(item);
      }).toList();

    } catch (e) {
      throw Exception('Gagal membaca data wisata: $e');
    }
  }

}