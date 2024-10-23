import 'package:flutter/material.dart';
import '../cubits/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: productspageveiw(),
    );
  }
}

class productspageveiw extends StatelessWidget {
  double price(String price) {
    double p = double.parse(price.replaceAll(',', ''));

    return (p * 6.20);
  }

  const productspageveiw({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<dynamic>>(
        future: cubit.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show a loading indicator
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found'));
          } else {
            // double items = snapshot.data!.length;
            return ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> product = snapshot.data![index];

                return UnconstrainedBox(
                  child: Container(
                    width: 300,
                    height: 180,
                    child: Card(
                      color: const Color(0xff0377AA),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Image.network(product['imageUrl'],
                              width: 150, height: 100, fit: BoxFit.fill),
                        ),
                        Text(
                          product['title'].toString().substring(0, 30),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          '${price(product['price'])} LYD',
                          style: const TextStyle(color: Color(0xffF2DF3A)),
                        )
                      ]),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
