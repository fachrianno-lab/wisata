import 'package:flutter/material.dart';
import '../models/wisata.dart';
import '../widgets/info_item.dart';

class DetailPage extends StatelessWidget {
  final Wisata wisata;

  const DetailPage({
    super.key,
    required this.wisata,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        title: const Text(
          'Detail Wisata',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              height: 190,
              color: Colors.green.shade100,
              child: const Icon(
                Icons.landscape,
                size: 100,
                color: Colors.green,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    wisata.nama,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.green,
                        size: 20,
                      ),

                      const SizedBox(width: 6),

                      Expanded(
                        child: Text(
                          wisata.lokasi,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Informasi Wisata',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  InfoItem(
                    icon: Icons.confirmation_number,
                    judul: 'Harga Tiket Masuk',
                    isi: wisata.tiketGratis
                        ? 'GRATIS'
                        : wisata.hargaFormat,
                  ),

                  InfoItem(
                    icon: Icons.access_time,
                    judul: 'Jam Buka',
                    isi: wisata.jamBuka,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Deskripsi Wisata',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        wisata.deskripsi,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  if (wisata.tiketGratis)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.celebration,
                            color: Colors.green,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Wisata ini GRATIS!',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}