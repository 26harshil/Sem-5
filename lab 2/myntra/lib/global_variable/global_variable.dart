class GlobalVariable {
  List<Map<String, dynamic>> products = [
    {
      'image': [
        'assets/images/yellowkurti.jpg',
        'assets/images/yellowback.jpg',
        'assets/images/frontyellow.jpg',
        'assets/images/properfront.jpg',
      ],
      'text': 'Printed Yellow Kurta for Women',
      'price': '₹800',
      'gender': "Women",
      'id': 1,
      'discount': "60%",
      'originalPrice': "₹5000",
      'about':
          "Zari Highlights: Enhanced with zari highlight, this kurta set glimmers with threads that weave a luxurious tapestry of elegance. As light dances across its surface, it infuses your everyday style with a radiant touch of sophistication.",
    },
    {
      'image': ['assets/images/jacket.png'],
      'text': 'Brown Leather Jacket For men',
      'price': '₹1000',
      'gender': "Men",
      'id': 2,
    },
  ];
  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
}
