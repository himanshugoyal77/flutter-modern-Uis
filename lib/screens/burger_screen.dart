import 'package:burger_app/constants/theme_colors.dart';
import 'package:burger_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BurgerScreen extends StatefulWidget {
  BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  List<String> selected = [];
  int quantity = 1;
  double price = 9.99;
  bool clicked = false;
  int cartItemCount = 0;
  bool isLiked = false;
  bool clickedHeart = false;

  final List categories = [
    "All item",
    "Popular",
    "New items",
    "Special",
    "Burger",
  ];

  final List<List<String>> _children = [
    ["assets/bread/p4.png"],
    ["assets/leaf/leaf.png"],
    ["assets/meat/m1.png"],
    ["assets/sauce/s.png"],
    ["assets/cheese/ch2.png"],
    ["assets/tomato/t1.png"]
  ];

  List<bool> isSelect = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List itemPrice = [
    2.99,
    4.99,
    6.99,
    2.99,
    3.99,
    1.99,
  ];

  double spice = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          "Burger",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.shopping_cart_outlined, color: Colors.black),
              Positioned(
                  top: -8,
                  right: -4,
                  child: CircleAvatar(
                      radius: 8,
                      backgroundColor: primary,
                      foregroundColor: primary,
                      child: Text(
                        cartItemCount.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )))
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories
                  .map((e) => Container(
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                            //   color: Colors.red,
                            width: 2,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                            color: categories.indexOf(e) == 0
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        )),
                        margin: const EdgeInsets.fromLTRB(20, 10, 14, 0),
                        child: Text(
                          e,
                          style: categories.indexOf(e) == 0 ? h1() : ptag(),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    selected.isNotEmpty
                        ? AnimatedScale(
                            scale: 0.8,
                            duration: const Duration(milliseconds: 200),
                            child: MakeYourBurger(selected: selected))
                        : Container(
                            height: 430,
                            child: Image.asset(
                              "assets/burger/burger.png",
                              height: 450,
                              colorBlendMode: BlendMode.dstOut,
                            ),
                          ),
                    Positioned(
                      top: 30,
                      right: 12,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                            clickedHeart = true;
                          });

                          Future.delayed(const Duration(milliseconds: 100), () {
                            setState(() {
                              clickedHeart = false;
                            });
                          });
                        },
                        child: isLiked
                            ? AnimatedScale(
                                scale: clickedHeart ? 1.5 : 1,
                                curve: Curves.easeIn,
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  CupertinoIcons.suit_heart_fill,
                                  color: isLiked ? Colors.red : Colors.grey,
                                ),
                              )
                            : const Icon(
                                CupertinoIcons.suit_heart,
                                //color: isLiked ? Colors.red : Colors.grey,
                              ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 350,
                  decoration: BoxDecoration(
                    //   color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: _children.map((e) {
                        int currIndex = _children.indexOf(e);
                        print(currIndex);
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelect[currIndex] = !isSelect[currIndex];
                                  selected.add(e[0]);
                                  if (isSelect[currIndex] == true) {
                                    price += itemPrice[currIndex];
                                  }
                                });
                              },
                              child: Container(
                                  height: 80,
                                  width: 80,
                                  alignment: Alignment.topRight,
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.only(bottom: 8),
                                  //  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: isSelect[currIndex]
                                          ? background
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          e[0],
                                        ),
                                        fit: BoxFit.contain,
                                      )),
                                  child: isSelect[currIndex]
                                      ? const Icon(
                                          Icons.check_circle_rounded,
                                          size: 17,
                                        )
                                      : Container()),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Add your own \nIngredients",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "from",
                      style: ptag(),
                    ),
                    Text(
                      "${price.floorToDouble()}\$",
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.end,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "For the cheese burger around. \ntry these moreish raclette burgers.",
                    style: ptag()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 90,
                      height: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (quantity == 0) {
                                  return;
                                }
                                quantity--;
                              });
                            },
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Icon(
                                  Icons.remove_outlined,
                                  color: Colors.grey,
                                  size: 12,
                                )),
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.end,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              quantity++;
                            }),
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Icon(
                                  Icons.add_outlined,
                                  color: Colors.grey,
                                  size: 12,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                //color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Spice 🌶️",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w600)),
                    Slider(
                        activeColor: primary,
                        inactiveColor: Colors.grey[200],
                        divisions: 2,
                        thumbColor: primary,
                        value: spice,
                        label: spice.round().toString(),
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            spice = value;
                          });
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(" Mild",
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Text(" Medium",
                            style: TextStyle(
                                color: primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        const Text(" Hot",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    clicked = true;
                    cartItemCount++;
                  });

                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      clicked = false;
                    });
                  });
                },
                child: AnimatedScale(
                  scale: clicked ? 0.9 : 1,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    width: 140,
                    margin: const EdgeInsets.only(right: 20, bottom: 0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12.0),
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text("Add to cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  TextStyle ptag() {
    return TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 14);
  }

  TextStyle h1() {
    return const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);
  }
}
