import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
    runApp(const InfoWisataApp());
}

class InfoWisataApp extends StatelesWidget {
    const InfoWisataApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Info Wisata Daerah',

            debugShowCheckedModeBanner: false,

            theme: ThemeData(
                primarySwatch: Colors.green,
                scaffoldBackgroundColor: Colors.white,
                useMaterial3: true,
            ),

            home: const HomePage(),
        );
    }
}