import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Utils/AppColors.dart';
import '../Utils/AppStyle.dart';
import '../Utils/ToggleLanguage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static const routeName = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  List<Color> colors = [Colors.red, Colors.blue, Colors.green];
  List<String> images = [
    "assets/images/Birthday.png",
    "assets/images/Book Club.png",
    "assets/images/Eating.png",
  ];

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(viewportFraction: .8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primarylight,
        title: Text("our_products".tr(), style: AppStyle.bold24White),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: height * 0.251, // You need to give PageView a height
                child: Container(
                  color: Colors.black12,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 3, // For example, 3 pages
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: width * .06),
                          child: Container(
                            clipBehavior: Clip.antiAlias,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            width: width * .8,
                            height: height * .2,
                            child: Image.asset(images[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                children: [
                  Text("hot_offers", style: AppStyle.bold20PrimaryLight).tr(),
                ToggleLanguage()],
              ),
              SizedBox(height: height * 0.01),
              Container(
                height: height * .35,
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(height * .01),
                      width: width * .3,
                      height: height * .1,
                      child: Column(
                        children: [
                          Image.asset("assets/images/test.jpg"),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [ IconButton(
                              onPressed: () {
                                SnackBar addSnackBar = SnackBar(
                                  content: Text("Item added to the cart"),
                                );
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(addSnackBar);
                              },
                              icon: Icon(
                                Icons.add_shopping_cart,
                                color: AppColors.primarylight,
                              ),
                            ),
                              Text(
                                'Smart Watch',
                                style: AppStyle.bold16PrimaryLight.copyWith(),
                              ),
                            ],
                          ),
                          Text(
                            "50",
                            style: AppStyle.bold14PrimaryLight.copyWith(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .3,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: width * .03, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1.0,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                "assets/images/test.jpg",
                                width: width * 0.3,
                                height: width * 0.2,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                             Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '50% Off Electronics',
                                    style: AppStyle.bold20Black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    "Limited time offer on all tech gadgets",
                                    style: AppStyle.light20gray,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),            ],
          ),
        ],
      ),
    );
  }
}
