import 'package:flutter/material.dart';
import 'package:myapp/modelproduk.dart';
import 'package:provider/provider.dart';

class Detailpage extends StatelessWidget {
  final Produk produk;
  const Detailpage({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: (){}, icon: Badge(
          label: Consumer<ProviderKeranjang>(builder:
          
          (context,value,child)=>Text
          (value.jumlahkeranjang.toString()),
          child: const Icon(Icons.shopping_bag_rounded),
          ),
        ),),
      ],
      
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(aspectRatio: 16/9,child: Image.network(produk.gambar),),
            Text(produk.judul,style: const TextStyle(fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon (Icons.people),
                Text(produk.jumlah.toString(),style: const TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.people),
                    Text(produk.jumlah.toString(),style: const TextStyle(fontSize: 20),)
                  ],
                ),
              ],
            ),
     Container(margin: const EdgeInsets.symmetric(vertical: 4),
        child: const Text('Deskripsi Produk'style: 
        TextStyle(
          color: Colors.pink,
          fontSize: 20,
          fontWeight: FontWeight.bold),),
        ),
        Card(color: Colors.pink.shade100,child: 
        Padding(padding: const EdgeInsets.all(8)
        child: Text(produk.deskripsi),
        ),
        ),

     Container(margin: const EdgeInsets.symmetric(vertical: 4),
        child: const Text('Produk Serupa'style: 
        TextStyle(
          color: Colors.pink,
          fontSize: 20,
          fontWeight: FontWeight.bold),),
        ),
        Consumer<ProviderProduk>(
          builder: (context, providerProduk, child) {
            providerProduk.ProdukKategori(produk.kategori);
            return SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: providerProduk.listProdukSerupa.length,
                itemBuilder: (context, index) {
                  final produkSerupa = providerProduk.listProdukSerupa[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: 150,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Expanded(child: Image.network(produkSerupa.gambar)),
                            Text(
                              produkSerupa.judul,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(formatRupiah(produkSerupa.harga),
                                style: TextStyle(color: Colors.red)),
                            Text('${produkSerupa.jumlah}Terjual')
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },

        ),
      ),
    ),
  floatingActionButton: ElevatedButton(onPressed: (){
    Provider.of<ProviderKeranjang>(context,listen: false).simpanProduk(produk);
    ScaffoldMessenger.of(context).showSnackBar(snackBar(content: Text('Berhasil Menambahkan Ditambahkan')));
  },
  label:const Text('Beli'),
  icon: Icon(Icons.add),
  style: ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(Colors.white),
    backgroundColor: WidgetStatePropertyAll(Colors.pink),
  ),
  ),
  }

}