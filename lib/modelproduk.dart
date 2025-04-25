class Produk {
  final int id;
  final String title;
  final num price;
  final String description;
  final String image;
  final num rating;
  final int count;

  Produk({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
    required this.count,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      rating: json['rating'],
      count: json['count'],
    );
  }
}

Map<String, Object> toJson() => {
  'id': id,
  'title': judul,
  'price': harga,
  'description': deskripsi,
  'category': kategori,
  'image': foto,
  'rating': {'rate': rating, 'count': jumlah},
};

class providerProduk extends ChangeNotifier {
  List<Produk> listProduk = [];
  List _listKategori  = [];
  List<Produk> listProdukSerupa = [];

  List<Produk> get listProdukSerupa => _listProdukSerupa;
  List<Produk> get listProduk => _listProduk;
  List get listKategori => _listKategori [];
  int get jumlahProduk => listProduk.length;
  bool isloading = false;

  providerProduk() {
    _ambilProduk();
    _ambilKategori();
    
  }  
}

void  _ambilProduk() async {
  isloading = true;
  notifyListeners();
  final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if(respon.statusCode==200){
    final List data= jsonDecode(response.body);
    _listProduk = data.map((e) => Produk.fromJson(e)).toList();
    isloading = false;
    notifyListeners();

  }
  throw Exception('gagal mengambil data');
}
