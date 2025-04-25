import 'package:flutter/material.dart';
import 'package:myapp/modelproduk.dart';
import 'package:provider/provider.dart';

class Keranjang extends StatelessWidget {
  const Keranjang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("ini adalah halaman keranjang")),
    );
  }
}

class ListProduk extends StatelessWidget {
  const ListProduk({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderKeranjang>(
      builder:
          (context, value, child) => ListView.builder(
            itemCount: value.jumlahKeranjang,
            itemBuilder: (context, index) {
              Produk produk = value.listKeranjang[index];
              return ListTile(leading: Image.network(produk.gambar));
            },
          ),
    );
  }
}
