import 'package:akilli_damacana/features/home/cart/viewmodel/cart_viewmodel.dart';
import 'package:akilli_damacana/core/extension/context_extension.dart';
import 'package:akilli_damacana/features/home/home_view/model/products_list_model.dart';
import 'package:akilli_damacana/services/rest_api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final apiService = RestApiService();
  late Future products;
  @override
  void initState() {
    super.initState();
    products = apiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: products,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        var models = snapshot.data.data!.products!.data!;
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.mediumValue,
            vertical: context.highValue,
          ),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemCount: models.length,
            itemBuilder: (BuildContext context, int index) {
              ProductModel model = models[index];
              return Consumer<CartViewModel>(builder: (_, _cartViewModel, ___) {
                return GestureDetector(
                  onTap: () {
                    if (context.read<CartViewModel>().cart.contains(model) ==
                        false) {
                      context.read<CartViewModel>().addOrder(model);
                    } else {
                      context.read<CartViewModel>().increment(model);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.read<CartViewModel>().cart.contains(model)
                          ? context.colors.secondary.withOpacity(0.75)
                          : context.colors.primary,
                      borderRadius: BorderRadius.all(
                        context.lowRadius,
                      ),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xff94C11F),
                      ),
                    ),
                    child: Stack(
                      children: [
                        ListTile(
                          title: Center(
                            child: Text(
                              "${model.brand}",
                              style: context.textTheme.bodyText1!.copyWith(
                                color: context.colors.primaryVariant,
                              ),
                            ),
                          ),
                        ),
                        context.read<CartViewModel>().cart.contains(model) ==
                                false
                            ? const SizedBox()
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "+${model.count}",
                                      style:
                                          context.textTheme.headline4!.copyWith(
                                        color: context.colors.primary,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Spacer(
                                          flex: 1,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            height: 30,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                context.lowRadius,
                                              )),
                                              margin: EdgeInsets.zero,
                                              child: InkWell(
                                                onTap: () {
                                                  if (model.count == 1) {
                                                    context
                                                        .read<CartViewModel>()
                                                        .removeOrder(model);
                                                  }
                                                  context
                                                      .read<CartViewModel>()
                                                      .decrement(model);
                                                },
                                                child: Icon(
                                                  Icons.remove,
                                                  color:
                                                      context.colors.secondary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 2,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            height: 30,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                context.lowRadius,
                                              )),
                                              margin: EdgeInsets.zero,
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<CartViewModel>()
                                                      .increment(model);
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color:
                                                      context.colors.secondary,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(
                                          flex: 1,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        );
      },
    );
  }
}
