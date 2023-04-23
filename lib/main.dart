import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/repo/product_repository.dart';
import 'package:flutter_project/ui/pages/detail/detail_cubit.dart';
import 'package:flutter_project/ui/pages/home/home_cubit.dart';
import 'package:flutter_project/ui/pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final IProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (BuildContext context) => HomeCubit(productRepository),
          ),
          BlocProvider<DetailCubit>(
            create: (BuildContext context) => DetailCubit(),
          )
        ],
        child: const MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
