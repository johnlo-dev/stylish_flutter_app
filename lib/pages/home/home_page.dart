import 'package:flutter/material.dart';

import '../../general_widgets/stylish_header.dart';
import 'model/product.dart';
import 'model/stylish_category.dart';
import 'widgets/category/home_category_list.dart';
import 'widgets/home_banner.dart';

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

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(children: [
            StylishHeader(hasIcBack: false),
            MainBanner(
                bannerList: const [bannerUrl, bannerUrl, bannerUrl, bannerUrl]),
            MainCategoryList(categoryList: <StylishCategory>[
              StylishCategory("女裝", <Product>[
                Product(
                    111111,
                    "透肌砰砰防曬襯衫",
                    "服裝（亦稱為衣物、衣服、衣著）最廣義的定義，除了指軀幹與四肢的遮蔽物之外，還包括了手部（手套）、腳部（襪子、鞋子、涼鞋、靴子）與頭部（帽子）的遮蔽物，以及延伸出來的服裝配飾。幾乎所有的人類都有穿著衣物的文化。人類穿戴衣物有社會性的理由。服裝中的許多物件都帶有某種文化、宗教與社會意義。某些色彩也和性別有關，例如自第一次世界大戰起，美國社會就習慣將藍色連結到男孩，讓粉紅色連結到女孩，而在戰前的情況則剛好相反。",
                    "文字",
                    "洗滌",
                    "中國",
                    "注意事項",
                    "故事",
                    ["red", "blue", "yellow"],
                    ["S", "M", "L"],
                    [
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/1.jpg',
                    ],
                    femaleUrl,
                    "100")
              ]),
              StylishCategory("男裝", <Product>[
                Product(
                    111111,
                    "男裝防曬襯衫1",
                    "服裝（亦稱為衣物、衣服、衣著）最廣義的定義，除了指軀幹與四肢的遮蔽物之外，還包括了手部（手套）、腳部（襪子、鞋子、涼鞋、靴子）與頭部（帽子）的遮蔽物，以及延伸出來的服裝配飾。幾乎所有的人類都有穿著衣物的文化。人類穿戴衣物有社會性的理由。服裝中的許多物件都帶有某種文化、宗教與社會意義。某些色彩也和性別有關，例如自第一次世界大戰起，美國社會就習慣將藍色連結到男孩，讓粉紅色連結到女孩，而在戰前的情況則剛好相反。",
                    "文字",
                    "洗滌",
                    "中國",
                    "注意事項",
                    "故事",
                    ["red", "blue", "yello"],
                    ["S", "M", "L", "XL", "5L"],
                    [
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/1.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/1.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg'
                    ],
                    maleUrl,
                    "100"),
                Product(
                    111111,
                    "男裝防曬襯衫2",
                    "服裝（亦稱為衣物、衣服、衣著）最廣義的定義，除了指軀幹與四肢的遮蔽物之外，還包括了手部（手套）、腳部（襪子、鞋子、涼鞋、靴子）與頭部（帽子）的遮蔽物，以及延伸出來的服裝配飾。幾乎所有的人類都有穿著衣物的文化。人類穿戴衣物有社會性的理由。服裝中的許多物件都帶有某種文化、宗教與社會意義。某些色彩也和性別有關，例如自第一次世界大戰起，美國社會就習慣將藍色連結到男孩，讓粉紅色連結到女孩，而在戰前的情況則剛好相反。",
                    "文字",
                    "洗滌",
                    "中國",
                    "注意事項",
                    "故事",
                    ["red", "blue", "yello"],
                    ["S", "M", "L"],
                    [
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/1.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg'
                    ],
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
                    ["red", "blue", "yello"],
                    ["S", "M", "L"],
                    [
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/1.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg'
                    ],
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
                    ["red", "blue", "yello"],
                    ["S", "M", "L"],
                    [
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/1.jpg',
                    ],
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
                    ["red", "blue", "yello"],
                    ["S", "M", "L"],
                    [
                      'https://api.appworks-school.tw/assets/201807202140/0.jpg',
                      'https://api.appworks-school.tw/assets/201807202140/1.jpg',
                    ],
                    accessoryUrl,
                    "100")
              ])
            ])
          ])),
    );
  }
}
