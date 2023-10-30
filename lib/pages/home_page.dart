import 'package:app/models/product.dart';
import 'package:app/pages/pesan.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final List<Product> makanan = [];

  void dummyMenu() {
    makanan.add(Product(
        judul: 'Sate Ayam',
        deskripsi: "Sate yang dibuat dari ayam",
        harga: 20000,
        imageUrl: 'satemadura.jpg'));
    makanan.add(Product(
        judul: 'Sate Padang',
        deskripsi: "Sate Padang Rempah",
        harga: 20000,
        imageUrl: 'satepadang.jpg'));
    makanan.add(Product(
        judul: 'Nasi Goreng',
        deskripsi: "Nasi Goreng Semarang",
        harga: 12000,
        imageUrl: 'nasigoreng.jpg'));
    makanan.add(Product(
        judul: 'Mie Goreng',
        deskripsi: "Mie Goreng Semarang",
        harga: 12000,
        imageUrl: 'miegoreng.jpg'));
    makanan.add(Product(
        judul: 'Mie Dog-Dog',
        deskripsi: "Mie Dog Dog Semarang",
        harga: 12000,
        imageUrl: 'miedokdok.jpg'));
    makanan.add(Product(
        judul: 'Mie Ayam',
        deskripsi: "Mie Ayam Bali",
        harga: 10000,
        imageUrl: 'mieayam.jpg'));
    makanan.add(Product(
        judul: 'Siomay',
        deskripsi: "Siomay Tengiri Bandung",
        harga: 10000,
        imageUrl: 'siomay.jpg'));
    makanan.add(Product(
        judul: 'Kwetiau',
        deskripsi: "Kwetiau China",
        harga: 13000,
        imageUrl: 'kwetiau.jpg'));
    makanan.add(Product(
        judul: 'Kwetiau',
        deskripsi: "Kwetiau China",
        harga: 13000,
        imageUrl: 'kwetiau.jpg'));
    makanan.add(Product(
        judul: 'Kwetiau',
        deskripsi: "Kwetiau China",
        harga: 13000,
        imageUrl: 'kwetiau.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    dummyMenu();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplikasi Penjualan Ayamku',
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 15),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.asset('assets/${makanan[index].imageUrl}'),
            footer: Container(
              alignment: Alignment.center,
              color: Colors.orange,
              child: Column(
                children: [
                  Text(
                    makanan[index].judul,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w900),
                  ),
                  Text("Rp ${makanan[index].harga}"),
                  // Text(
                  //   makanan[index].deskripsi,
                  //   maxLines: 1,
                  // ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PesanPage(
                                    pesananMenu: makanan[index],
                                  )));
                    },
                    child: ButtonTheme(
                      minWidth: 55, // Ubah sesuai kebutuhan
                      height: 10, // Ubah sesuai kebutuhan
                      child: Text(
                        "Beli",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: makanan.length,
      ),
    );
  }
}
