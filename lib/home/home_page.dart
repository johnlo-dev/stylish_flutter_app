import 'package:flutter/material.dart';
import 'package:flutter_project/home/model/stylish_category.dart';
import 'package:flutter_project/home/widgets/category/home_category_list.dart';

import 'model/product.dart';
import 'widgets/home_banner.dart';
import 'widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    const bannerUrl = "https://i.ytimg.com/vi/DaFxQ-eIGXM/maxresdefault.jpg";
    const femaleUrl =
        "https://i.pinimg.com/736x/31/2c/76/312c760b634a09f4ee188e11b58e3099.jpg";
    const maleUrl =
        "https://cdn1.cybassets.com/s/files/17730/theme/58399/assets/img/1630566638_c323f24b_index_block_3.jpg?1630566638";
    const accessoryUrl =
        "https://is2-ssl.mzstatic.com/image/thumb/Purple126/v4/32/70/36/3270360a-4e41-651e-7fdc-c7971cb9cef0/iMessage_App_Icon-0-0-1x_U007emarketing-0-0-0-0-0-3-sRGB-0-0-0-GLES2_U002c0-512MB-85-181-0-0.png/266x200bb.jpeg";

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          const MainHeader(title: "Stylish"),
          MainBanner(
              bannerList: const [bannerUrl, bannerUrl, bannerUrl, bannerUrl]),
          MainCategoryList(categoryList: <StylishCategory>[
            StylishCategory("女裝", <Product>[
              Product(
                  111111,
                  "透肌砰砰防曬襯衫",
                  "描述",
                  "文字",
                  "洗滌",
                  "中國",
                  "注意事項",
                  "故事",
                  [Colors.red, Colors.blue, Colors.yellow],
                  ["S", "M", "L"],
                  [femaleUrl],
                  femaleUrl,
                  "100")
            ]),
            StylishCategory("男裝", <Product>[
              Product(
                  111111,
                  "男裝防曬襯衫1",
                  "描述",
                  "文字",
                  "洗滌",
                  "中國",
                  "注意事項",
                  "故事",
                  [Colors.red, Colors.blue, Colors.yellow],
                  ["S", "M", "L"],
                  [maleUrl],
                  maleUrl,
                  "100"),
              Product(
                  111111,
                  "男裝防曬襯衫2",
                  "描述",
                  "文字",
                  "洗滌",
                  "中國",
                  "注意事項",
                  "故事",
                  [Colors.red, Colors.blue, Colors.yellow],
                  ["S", "M", "L"],
                  [maleUrl],
                  maleUrl,
                  "100")
            ]),
            StylishCategory("配件", <Product>[
              Product(
                  111111,
                  "配件防曬襯衫1",
                  "描述",
                  "文字",
                  "洗滌",
                  "中國",
                  "注意事項",
                  "故事",
                  [Colors.red, Colors.blue, Colors.yellow],
                  ["S", "M", "L"],
                  [accessoryUrl],
                  accessoryUrl,
                  "100"),
              Product(
                  111111,
                  "配件防曬襯衫2",
                  "描述",
                  "文字",
                  "洗滌",
                  "中國",
                  "注意事項",
                  "故事",
                  [Colors.red, Colors.blue, Colors.yellow],
                  ["S", "M", "L"],
                  [accessoryUrl],
                  accessoryUrl,
                  "100"),
              Product(
                  111111,
                  "配件防曬襯衫3",
                  "描述",
                  "文字",
                  "洗滌",
                  "中國",
                  "注意事項",
                  "故事",
                  [Colors.red, Colors.blue, Colors.yellow],
                  ["S", "M", "L"],
                  [accessoryUrl],
                  accessoryUrl,
                  "100")
            ])
          ])
        ]));
  }
}
