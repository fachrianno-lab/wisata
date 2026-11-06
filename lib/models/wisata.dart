class Wisata {
    final int id;
    final String nama;
    final String lokasi;
    final int hargaTiket;
    final String jamBuka;
    final String deskripsi;

    Wisata({
        required this.id,
        required this.nama,
        required this.lokasi,
        required this.hargaTiket,
        required this.jamBuka,
        required this.deskripsi,
    });

    factory Wisata.fromJson(Map<String, dynamic> json) {
        return Wisata(
            id: json['id'],
            nama: json['nama'],
            lokasi: json['lokasi'],
            hargaTiket: json['hargaTiket'],
            jamBuka: json['jamBuka'],
            deskripsi: json['deskripsi'],
        );
    }

    bool get tiketGratis => hargaTiket == 0;

    String get hargaFormat {
        if (tiketGratis) {
            return 'GRATIS';
        }

        return 'Rp${hargaTiket.toString()}';
    }
}
