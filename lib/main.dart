import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Fungsi untuk membuka link
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Tidak bisa membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1F26),
      body: Center(
        child: Card(
          elevation: 8,
          color: const Color(0xFF262A34),
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // FOTO PROFIL
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/iqbal.jpg', // ganti sesuai nama file foto
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 24),
                // TEKS & SOSMED
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Maulana Iqbal Hidayah',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Mahasiswa',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Saya adalah seorang yang suka berpetualang dan sangat menyukai alam. '
                        'Saya lahir di kota Pekanbaru, memiliki keahlian mengedit, '
                        'dan bercita-cita keliling dunia untuk melihat keindahan dunia.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // SOSIAL MEDIA
                      Row(
                        children: [
                          IconButton(
                            onPressed: () =>
                                _launchURL('https://twitter.com/username'),
                            icon: const FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () => _launchURL(
                              'https://facebook.com/Maulana Iqbal',
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                _launchURL('https://instagram.com/mlanaiqball'),
                            icon: const FaIcon(
                              FontAwesomeIcons.instagram,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
