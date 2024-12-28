import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // list of images
  List product = [
    "assets/41jnwuqtAcL.jpg",
    "assets/images (7).jpeg",
    "assets/Face_Prep.jpg",
    "assets/images (1).jpeg",
    "assets/images (3).jpeg",
    "assets/images (4).jpeg",
    "assets/images (6).jpeg",
    "assets/R03649220_ULTRABLACK_M.jpeg",
  ];

  // list of images
  List offer = [
    "assets/images (2).jpeg",
    "assets/images (10).jpeg",
    "assets/images (9).jpeg",
    "assets/images.jpeg",
    "assets/Maybelline-Face-Instant.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFFFC6C6),
        centerTitle: true,
        title: Text("Shopping App"),
      ),
      body: ListView(// to make the screen scrollable
          children: [
        Column(children: [
          // section one
          Text(
            "Our Products",
            style: TextStyle(
              fontSize: 50,
            ),
          ),

          // images of the products
          Container(
              height: MediaQuery.of(context).size.height / 2,
              child: PageView(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset("assets/container(1).jpeg"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset("assets/container(2).jpeg"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset("assets/container(3).png"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset("assets/pallet.jpg"),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset("assets/images (8).jpeg"),
                  ),
                ],
              )),
          // section 2
          // cards with the product image and it's name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: product
                    .length, //the length of the above list with the images
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      //the card of the product
                      color: Color(0xFFFFEBD4),
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Image.asset(product[index]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  // contains the name and the cart icon
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "product $index",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            //message will be shown on the bottom of the screen
                                            content:
                                                Text('Item added to the cart'),
                                            duration: Duration(seconds: 2),
                                          ));
                                        },
                                        icon: Icon(Icons.shopping_cart),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // section 3
          Text(
            "Hot Offers",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: offer.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            offer[index],
                            width: 200,
                          ),
                          Text(
                            "offer $index",
                            style: TextStyle(fontSize: 50),
                          )
                        ],
                      )),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
