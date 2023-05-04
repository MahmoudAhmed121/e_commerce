import 'package:e_commerce/ui/model/categorry.dart';
import 'package:e_commerce/ui/repo/category_repo.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xff40BFFF),
                              ),
                              hintText: "Search Product",
                              border: OutlineInputBorder()),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xff9098B1),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xff9098B1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: CarouselSlider.builder(
                        options: CarouselOptions(
                          autoPlay: true,
                        ),
                        // 0 1 2 3
                        itemCount: 4,
                        itemBuilder: (context, index, int pageViewIndex) {
                          return Container(
                            width: 300,
                            child: InkWell(
                              child: Image.asset("images/Promotion Image.png"),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "MoreCategory",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),

                  FutureBuilder<List<CategoryModel>>(
                    future: CategoryRepo().getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      var data = snapshot.data;
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          margin: EdgeInsets.only(left: 12, right: 12),
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            NetworkImage(data[index].image),
                                      ),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      data[index].name,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }else{
                       return SizedBox();
                      }
                    },
                  ),
                  // list of icon

                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Flash Sale",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See More",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff40BFFF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    height: 245,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 215, 221, 237)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "images/image Product.png",
                                    width: 120,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "MS - Nike Air Max 270 React...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(children: [
                                    Text(
                                      "\$299,43",
                                      style: TextStyle(
                                        color: Color(0xff40BFFF),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$534,33",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "24",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mega Sale",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "See More",
                            style: TextStyle(
                              color: Color(0xff40BFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /////////////////////// catogery 2//////////////
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    height: 238,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 215, 221, 237),
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "images/image Product.png",
                                    width: 120,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "MS - Nike Air Max 270 React...",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "299,43",
                                          style: TextStyle(
                                              color: Color(0xff40BFFF),
                                              fontSize: 12),
                                        ),
                                      ]),
                                  Row(
                                    children: [
                                      Text(
                                        "\$534,33",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "24 % off",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Stack(
                    children: [
                      Image.asset("images/Promotion Image.png"),
                      Container(
                        margin: EdgeInsets.only(
                          left: 24,
                        ),
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Recomended",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Product",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "We recommend the best for you",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //////////////////////categore 3//////////////////
                  Container(
                      margin: EdgeInsets.only(left: 16),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 215, 221, 237),
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                          "images/image Product (1).png"),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Nike Air Max 270 React ENG",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 12,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 12,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 12,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star_purple500_sharp,
                                            size: 12,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star_border_outlined,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "299,3",
                                        style: TextStyle(
                                          color: Color(0xff40BFFF),
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "534,33",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "24",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.red,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                ]))),
      ),
    );
  }
}
