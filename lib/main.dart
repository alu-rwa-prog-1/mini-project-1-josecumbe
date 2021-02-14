import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlineshop/models/Product.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Color(0xFF535353),
        child: Icon(
            Icons.chat),
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF535353),
                ),
                child: Container (
                  child: CircleAvatar(backgroundColor: Colors.blueGrey,)
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      appBar: AppBar(
        title: Text(
          "Girl's Shop",
          style: TextStyle(color: Color(0xFF535353), fontSize: 19.0, fontWeight: FontWeight.bold)
        ),
          iconTheme: IconThemeData(color: Color(0xFF535353)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget> [
          IconButton(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                color: Color(0xFF535353),
              ),
              onPressed: (){}
              ),

          IconButton(
              icon: SvgPicture.asset(
                'assets/icons/cart.svg',
                color: Color(0xFF535353),
              ),
              onPressed: (){}
          ),
          SizedBox(width: 10.0)
        ]

      ),
      body: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Categories(),
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
              itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                ),
                itemBuilder: (context, index) => ItemCard(product : products[index]),
            ),
          ))



        ],
      )
    );

  }
}

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key, this.product, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 12
          ,
          child: Container(
            padding: EdgeInsets.all(20.0),
            // height: 180,
            // width: 160,
            decoration: BoxDecoration (
              color: product.color,
              borderRadius: BorderRadius.circular(16),


            ),
            child: Image.asset(product.image),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
              product.title,
              style: TextStyle(
                color: Color(0xFFACACAC),
              )),
        ),
        Expanded(

          child: Text(
            "\Frw ${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],

    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 25.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCateg(index),
      )
      ),
    );
  }
  
  Widget buildCateg (int index) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categories[index],
            style: TextStyle (
              fontWeight: FontWeight.bold,
              color: currentIndex == index ? Color(0xFF535353) : Color(0xFFACACAC),
            )
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 2,
              width: 30,
              color: currentIndex == index ? Colors.black : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}






