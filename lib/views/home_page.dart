import 'package:flutter/material.dart';
import '../contollers/wisata_controller.dart';
import '../models/wisata.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final WisataController controller = wisataController();

    late Future<List<wisata>> daftarWisata;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.grey.shade100,

            appBar: appBar(
                backgroundColor: Colors.green.shade700,
                foregroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                    'Info Wisata Daerah',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                    ),
                ),
                centerTitle: true,
            ),

            body: Column(
                children: [
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                            color: Colors.green.shade700,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                            ),
                        ),
                        child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    'Jelajahi Wisata Daerah!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),

                                SizedBox(height: 8),

                                Text(
                                    'Temukan informasi tempat wisata, '
                                    'harga tiket, dan jam buka.',
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                    ),
                                ),
                            ],
                        ),
                    ),

                    const Padding(
                        padding: EdgeInsets.fromTRB(18, 20, 18, 12),
                        child: Row(
                            children: [
                                Icon(
                                    Icons.explore,
                                    color: Colors.green,
                                ),
                                SizedBox(width: 8),
                                Text(
                                    'Daftar Tempat Wisata',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ],
                        ),
                    ),

                    Expanded(
                        child: FutureBuilder<List<wisata>> (
                            future: daftarWisata,
                            builder: (context, snapshot) {

                                if (snapshot.connectionState == connectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator(),
                                    );
                                }

                                if (snapshot.hasError) {
                                    return Center(
                                        child: Text(
                                            'Gagal memuat data: ${snapshot.error}',
                                        ),
                                    );
                                }

                                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                    return const Center(
                                        child: Text('Belum ada data wisata.'),
                                    );
                                }

                                final wisataList = snapshot.data!;

                                return ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                    ),
                                    itemCount: wisataList.length,

                                    itemBuilder: (context, index) {
                                        final wisata = wisataList[index];

                                        return WisataCard(
                                            wisata: wisata,

                                            onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                            return DetailPage(
                                                                wisata: wisata,
                                                            );
                                                        },
                                                    ),
                                                );
                                            },
                                        );
                                    },
                                );
                            },
                        ),
                    ),
                ],
            ),
        );
    }
}