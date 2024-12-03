import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Poppins', // Add a custom font for a better look
      ),
      home: const HalamanDepanMahasiswa(),
    );
  }
}

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final String email;
  final String noHp;
  final String hobi;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.email,
    required this.noHp,
    required this.hobi,
  });
}

class HalamanDepanMahasiswa extends StatelessWidget {
  const HalamanDepanMahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    // Data mahasiswa yang sudah ditentukan
    final mahasiswa = Mahasiswa(
      nama: 'Eva Prashanti',
      nim: 'F12.2022.00064',
      prodi: 'Sistem Informasi',
      email: '612202200064@mhs.dinus.ac.id',
      noHp: '085812768710',
      hobi: 'Berenang',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(
        // Wrap the entire body content in Center
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center the content
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.blue[200],
                      backgroundImage: AssetImage(
                          'assets/WhatsApp Image 2024-12-03 at 14.33.11.jpeg'), // Use the image asset
                      // Remove the Icon widget here
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Eva',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  mahasiswa.nama,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'NIM: ${mahasiswa.nim}',
                  style: const TextStyle(
                      fontSize: 18, fontFamily: 'Poppins', color: Colors.grey),
                ),
                Text(
                  'Prodi: ${mahasiswa.prodi}',
                  style: const TextStyle(
                      fontSize: 18, fontFamily: 'Poppins', color: Colors.grey),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman profil
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfilMahasiswa(mahasiswa: mahasiswa),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins'),
                  ),
                  child: const Text('Lihat Profil Lengkap'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilMahasiswa extends StatelessWidget {
  final Mahasiswa mahasiswa;

  const ProfilMahasiswa({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Colors.blue[300],
      ),
      body: SingleChildScrollView(
        // Wrap the Column in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Center for avatar and name
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.blue[200],
                          backgroundImage: AssetImage(
                              'assets/WhatsApp Image 2024-12-03 at 14.33.11.jpeg'), // Use the image asset
                          // Remove the Icon widget here
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Eva',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      mahasiswa.nama,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align details to the left
                  children: [
                    _buildDetailRow(Icons.numbers, 'NIM', mahasiswa.nim),
                    const SizedBox(height: 10),
                    _buildDetailRow(Icons.school, 'Prodi', mahasiswa.prodi),
                    const SizedBox(height: 10),
                    _buildDetailRow(Icons.email, 'Email', mahasiswa.email),
                    const SizedBox(height: 10),
                    _buildDetailRow(Icons.phone, 'No. HP', mahasiswa.noHp),
                    const SizedBox(height: 10),
                    _buildDetailRow(Icons.favorite, 'Hobi', mahasiswa.hobi),
                    const SizedBox(height: 30),
                    Center(
                      // Center the button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[300],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                        child: const Text('Kembali Ke Halaman Utama'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method untuk membuat baris detail
  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue[300], size: 30),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start (left)
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
