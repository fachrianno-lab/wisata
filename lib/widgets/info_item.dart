import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
    final IconData icon;
    final String judul;
    final String isi;

    const InfoItem({
        super.key,
        required this.icon,
        required this.judul,
        required this.isi,
    });

    @override
    Widget build(BuildContext context) {
        return Card(
            elevation: 1,
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                    children: [
                        Icon(
                            icon,
                            color: Colors.green,
                            size: 28,
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        judul,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                        ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(
                                        isi,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
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