import 'package:flutter/material.dart';
import 'package:hooka/hooka_product/product_routes.dart';

import 'package:hooka/hooka_product/ui/screen/hooka_product.dart';
import 'package:hooka/hooka_product/ui/screen/prod_details.dart';
import 'package:injectable/injectable.dart';

import '../abstracts/module/rout_module.dart';

@injectable
class ProductModule extends RoutModule {
  final HookaProduct _hookaProduct;
  final DetailsProduct _detailsProduct;



  ProductModule(this._hookaProduct,this._detailsProduct) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProductsRoutes.Product: (context) => _hookaProduct,
      ProductsRoutes.ProductDetails: (context) => _detailsProduct,


    };
  }
}