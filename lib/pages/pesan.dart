import 'package:app/models/product.dart';
import 'package:app/pages/notapage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PesanPage extends StatefulWidget {
  PesanPage({super.key, required this.pesananMenu});

  Product pesananMenu;
  @override
  State<PesanPage> createState() => _PesanPageState(pesananMenu: pesananMenu);
}

class _PesanPageState extends State<PesanPage> {
  _PesanPageState({required this.pesananMenu});

  Product pesananMenu;
  int total = 0;
  int jumlah = 0;
  TextEditingController jmlhCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    jmlhCtrl.text = '0';
  }

  void changeJml(String op) {
    jumlah = int.tryParse(jumlah.toString()) ?? 0;
    if (op == '+') {
      jumlah++;
    } else if (op == '-') {
      jumlah--;
    }
    setState(() {
      total = jumlah * pesananMenu.harga;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pesanan Anda")),
      body: Column(
        children: [
          Image.asset('assets/${pesananMenu.imageUrl}'),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text("${pesananMenu.judul}"),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text("${pesananMenu.deskripsi}"),
          ),
          Container(
            child: Text("Rp. ${pesananMenu.harga}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    changeJml('-');
                  }),
              Text(jumlah.toString()),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  changeJml('+');
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                total.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotaPage(
                                pesananMenu: pesananMenu, jumlah: jumlah)));
                  },
                  child: const Text("Pesan Sekarang")))
        ],
      ),
    );
  }
}
