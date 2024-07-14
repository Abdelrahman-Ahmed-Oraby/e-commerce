// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductItem {
  final String itemImg;
  final double itemPrice;
  ProductItem({
    required this.itemImg,
    required this.itemPrice,
  });
}

List<ProductItem> items = [
  ProductItem(
    itemImg: 'assets/images/flower1.webp',
    itemPrice: 12.99,
  ),
  ProductItem(
    itemImg: 'assets/images/flower2.webp',
    itemPrice: 20.99,
  ),
  ProductItem(
    itemImg: 'assets/images/flower3.webp',
    itemPrice: 10.99,
  ),
  ProductItem(
    itemImg: 'assets/images/flower4.webp',
    itemPrice: 30.99,
  ),
  ProductItem(
    itemImg: 'assets/images/flower5.webp',
    itemPrice: 45.99,
  ),
  ProductItem(
    itemImg: 'assets/images/flower6.webp',
    itemPrice: 33.99,
  ),
  ProductItem(
    itemImg: 'assets/images/flower7.webp',
    itemPrice: 26.99,
  ),
  ProductItem(
    itemImg: 'assets/images/flower8.webp',
    itemPrice: 18.99,
  ),
];
