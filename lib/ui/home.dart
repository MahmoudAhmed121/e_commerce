import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
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
                    options: CarouselOptions(autoPlay: true),
                    // 0 1 2 3
                    itemCount: 4,
                    itemBuilder: (context, index, int pageViewIndex) {
                      return Container(
                          width: 300,
                          child: InkWell(
                              child:
                                  Image.asset("images/Promotion Image.png")));
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              Container(
                height: 150,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 70,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.amber,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.white,
                                    child: Image.asset("images/shirt.png"),
                                  ),
                                ),
                                Text("Man Shirt")
                              ],
                            )),
                      );
                    }),
              ),

              Container(
           
                height: 200,
                width: 500,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                             margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border:Border.all(color: Color(0xffEBF0FF)),
                          borderRadius: BorderRadius.circular(15)
                          
                        ),
                        child: Column(

                          children: [
                            Image.asset("images/image Product.png"),

                            SizedBox(height: 10,),

                            Text("\$299,43"),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}