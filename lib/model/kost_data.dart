class KostData {
  String name;
  String location;
  String description;
  String status;
  String type;
  String price;
  String thumbnail;
  List<String> images;

  KostData({
    required this.name,
    required this.location,
    required this.description,
    required this.status,
    required this.type,
    required this.price,
    required this.thumbnail,
    required this.images,
  });
}

var kostDataList = [
  KostData(
    name: 'Gumilang Kost',
    location: 'Pekalongan',
    description:
        'Kosan nyaman bikin betah, sekali anda menyewa kos ini serasa milik rumah sendiri,yakin dah!',
    status: 'Available',
    type: 'Campur',
    price: 'Rp 500.000',
    thumbnail: 'images/gumilang-kost.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam2.jpg'],
  ),
  KostData(
    name: 'Lintang Kost',
    location: 'Semarang',
    description:
        'Kos mewah, pelayanan ramah, pasti wah, wah, wah, serba wah, yakin dah!',
    status: 'Available',
    type: 'Laki-laki',
    price: 'Rp 600.000',
    thumbnail: 'images/lintang.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam.jpg'],
  ),
  KostData(
    name: 'Fajar Kost',
    location: 'Tegal',
    description: 'Kos nyaman maszeh, harga murah maszeh, gassss!',
    status: 'Available',
    type: 'Laki-laki',
    price: 'Rp 600.000',
    thumbnail: 'images/fajar.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam2.jpg'],
  ),
  KostData(
    name: 'Ladies Kost',
    location: 'Pemalang',
    description:
        'Kos khusus cewe, hanya untuk cewe, cowo gaboleh ngekos disini, ibu kosnya galak soalnya!',
    status: 'Available',
    type: 'Perempuan',
    price: 'Rp 600.000',
    thumbnail: 'images/ladies.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam.jpg'],
  ),
  KostData(
    name: 'Beach Kost',
    location: 'Pekalongan',
    description:
        'Kos pinggir pantai, view menarik, bisa untuk menikmati sunset, kos premium!',
    status: 'Available',
    type: 'Campur',
    price: 'Rp 1000.000',
    thumbnail: 'images/pantai_kost.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam2.jpg'],
  ),
  KostData(
    name: 'Ghost Kost',
    location: 'Batang',
    description: 'Kos berhantu, cocok untuk uji nyali!',
    status: 'Available',
    type: 'Laki-laki',
    price: 'Rp 100.000',
    thumbnail: 'images/ghost.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam2.jpg'],
  ),
  KostData(
    name: 'Ramah Kost',
    location: 'Pemalang',
    description: 'Kos paling ramah dan murah!',
    status: 'Available',
    type: 'Perempuan',
    price: 'Rp 300.000',
    thumbnail: 'images/farm-house.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam2.jpg'],
  ),
  KostData(
    name: 'Villa',
    location: 'Pemalang',
    description: 'Villa daerah pegunungan!',
    status: 'Available',
    type: 'Campur',
    price: 'Rp 900.000',
    thumbnail: 'images/vila.jpg',
    images: ['images/dapur.jpg', 'images/ruang.jpg', 'images/kolam2.jpg'],
  ),
];
