import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myntra/global_variable/global_variable.dart';
import 'package:myntra/widgets/single_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalVariable gb_variable = GlobalVariable();
  final List<String> imgList = [
    'https://www.kollybollyethnics.com/image/catalog/data/10Aug2018/Indian-Dress-Maroon-Color-Bridal-Lehenga-341M-1.jpg',
    'https://cdn1.bambinifashion.com/img/p/1/8/3/9/8/2/183982--product-gallery@2x.jpg',
    'https://th.bing.com/th/id/OIP.qYkay4lLOZq_Y_lVlyATOAHaKk?rs=1&pid=ImgDetMain',
    'https://i2.wp.com/handcmediastorage.blob.core.windows.net/productimages/SE/SEPMV014-G01-132687-800px-1040px.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 20,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(width: 10),
                Text(
                  "Myntra",
                  style: TextStyle(
                    color: Color(0xFF292929),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search_rounded, size: 30),
                ),
                CircleAvatar(
                  radius: 16,

                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5),
            child: Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  enlargeFactor: 0.3,
                ),
                items:
                    imgList
                        .map(
                          (item) => Container(
                            child: Center(
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [Image.asset('assets/images/men.png'), Text('men')],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/women.png'),
                    Text('women'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/child.png'),
                    Text('child'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/jewellery.png'),
                    Text('jewellery'),
                  ],
                ),
              ],
            ),
          ),

          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trednding Now !",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "See More",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: gb_variable.products.length,
              itemBuilder: (context, index) {
                final product = gb_variable.products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SingleProduct(product: product),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2.0),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      height: 150,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                product['image'][0],
                                fit: BoxFit.cover,
                                height: 130,
                                width: double.infinity,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.favorite),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Text(
                            textAlign: TextAlign.start,
                            product['gender'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            product['text'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            textAlign: TextAlign.end,
                            product['price'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
