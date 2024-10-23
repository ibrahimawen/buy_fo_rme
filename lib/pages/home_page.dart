import 'package:buyforme/pages/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:buyforme/cubits/home_cubit/home_cubit.dart';
import 'package:buyforme/pages/productpage.dart';
import 'dart:convert';
import './categories.dart';
import 'products.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  double price(String price) {
    double p = double.parse(price.replaceAll(',', ''));

    return (p * 6.20);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
              width: 360,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: const Color(0xff146C94)),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.location_on_sharp,
                              color: Colors.white,
                            )),
                        Container(
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Deliver to",
                                style: TextStyle(color: Color(0xffDADADA)),
                              ),
                              Text(
                                "Tripoli, alzahra",
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      style: IconButton.styleFrom(
                          backgroundColor: const Color(0xff146C94)),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ))
                ],
              ))
        ],
      ),
      body:
          //  BlocListener<HomeCubit, HomeState>(
          // listener: (context, state) {
          //   switch (state) {
          //     case HomeInitial():
          //       break;
          //     case HomeLoading():
          //     case HomeSuccess():
          //     case HomeFail():
          //       break;
          //   }
          // },
          SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              // if (state is HomeLoading) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              return Container(
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 340,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: const TextStyle(
                                color: Color(0xffC5C5C5),
                                fontWeight: FontWeight.bold),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xffC5C5C5),
                            ),
                            fillColor: const Color(0xffEFEFEF),
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 330,
                      child: const Text(
                        "Stores",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 350,
                      height: 180,
                      child: Card(
                        color: Colors.white,
                        elevation: 6,
                        child: Image.asset("images/amazon.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 330,
                      child: const Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Products())),
                              child: Card(
                                color: Colors.white,
                                child: SizedBox(
                                  width: 220,
                                  height: 150,
                                  child: Image.asset(
                                    'images/computers.jfif',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'computers',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                          Column(children: [
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                width: 220,
                                height: 150,
                                child: Image.asset(
                                  'images/gaming.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Text(
                              'Gaming',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                          Column(children: [
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                width: 220,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    'images/mobiles.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Mobiles',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                          Column(children: [
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                width: 220,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/home.jfif',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Home',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                          Column(children: [
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                width: 220,
                                height: 150,
                                child: Image.asset(
                                  'images/gaming.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Text(
                              'Gaming',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ])
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<dynamic>>(
                      future: cubit.fetchProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No products found'));
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final Map<String, dynamic> product =
                                  snapshot.data![index];

                              return UnconstrainedBox(
                                child: Container(
                                  width: 300,
                                  height: 180,
                                  child: Card(
                                    color: const Color(0xff0377AA),
                                    elevation: 5,
                                    margin: const EdgeInsets.all(10),
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProductPage(
                                                productUrl:
                                                    product['productUrl']),
                                          )),
                                      child: Column(children: [
                                        Container(
                                          // decoration:
                                          //     BoxDecoration(boxShadow: []),
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          alignment: Alignment.center,
                                          color: Colors.white,
                                          child: Image.network(
                                              product['imageUrl'],
                                              width: 150,
                                              height: 100,
                                              fit: BoxFit.fill),
                                        ),
                                        Text(
                                          product['title']
                                              .toString()
                                              .substring(0, 30),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${price(product['price'])} LYD',
                                          style: const TextStyle(
                                              color: Color(0xffF2DF3A)),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
