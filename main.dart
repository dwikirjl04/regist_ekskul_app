import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ekstrakurikuler Kampus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pendaftaran UKM & Organisasi mahasiswa',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Masukan NIM',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Tempatkan logika untuk memeriksa login di sini
                // Contoh sederhana: jika login berhasil, pindah ke halaman beranda
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pilih Ekstrakurikuler:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UKMPage(
                      ekstrakurikuler: 'Unit Kegiatan Mahasiswa',
                    ),
                  ),
                );
              },
              child: Text('UKM'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UKMPage(
                      ekstrakurikuler: 'Organisasi Mahasiswa',
                    ),
                  ),
                );
              },
              child: Text('ORGANISASI'),
            ),
          ],
        ),
      ),
    );
  }
}

class UKMPage extends StatelessWidget {
  final String ekstrakurikuler;

  UKMPage({required this.ekstrakurikuler});

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Pendaftaran Berhasil"),
          content: Text(
              "Selamat pendaftaran Anda untuk $ekstrakurikuler berhasil! Untuk informasi selanjutnya, Anda akan dihubungi oleh ketua organisasi."),
          actions: <Widget>[
            TextButton(
              child: Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ekstrakurikuler),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pilihan $ekstrakurikuler:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showDialog(context); // Memanggil dialog saat tombol ditekan
              },
              child: Text('UKM Musik'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showDialog(context); // Memanggil dialog saat tombol ditekan
              },
              child: Text('UKM Fotografi'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showDialog(context); // Memanggil dialog saat tombol ditekan
              },
              child: Text('UKM Mapala'),
            ),
            // Tambahkan tombol lain untuk UKM lainnya
          ],
        ),
      ),
    );
  }
}

