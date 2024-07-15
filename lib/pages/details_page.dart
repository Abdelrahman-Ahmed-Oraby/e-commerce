import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../models/product_item.dart';

class Details extends StatefulWidget {
  final ProductItem productItem;
  const Details({
    super.key,
    required this.productItem,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isShowMore = true;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: appBarGreen,
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(211, 164, 255, 193),
                    shape: BoxShape.circle),
                child: const Text(
                  "8",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_shopping_cart,
                  size: 24,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              "\$13",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.productItem.itemImg),
            SizedBox(height: screenSize.height * 0.01),
            Text(
              "\$ ${widget.productItem.itemPrice}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: Colors.red[300],
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          'New',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 29,
                            color: Color.fromARGB(255, 255, 191, 0),
                          ),
                          Icon(
                            Icons.star,
                            size: 29,
                            color: Color.fromARGB(255, 255, 191, 0),
                          ),
                          Icon(
                            Icons.star,
                            size: 29,
                            color: Color.fromARGB(255, 255, 191, 0),
                          ),
                          Icon(
                            Icons.star,
                            size: 29,
                            color: Color.fromARGB(255, 255, 191, 0),
                          ),
                          Icon(
                            Icons.star,
                            size: 29,
                            color: Color.fromARGB(255, 255, 191, 0),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.edit_location,
                            size: 26,
                            color: Color.fromARGB(168, 3, 65, 27),
                          ),
                          Text(
                            '${widget.productItem.location}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.018),
                  const Row(
                    children: [
                      Text(
                        'Details: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.018),
                  Text(
                    'A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). Flowers consist of a combination of vegetative organs – sepals that enclose and protect the developing flower, petals that attract pollinators, and reproductive organs that produce gametophytes, which in flowering plants produce gametes.The male gametophytes, which produce sperm, are enclosed within pollen grains produced in the anthers. The female gametophytes are contained within the ovules produced in the carpels.',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: isShowMore ? 6 : null,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isShowMore = !isShowMore;
                        });
                      },
                      child: Text(
                        (isShowMore) ? 'Show more' : 'Show Less',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
