// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductItem {
  final String itemImg;
  final String itemTitle;
  final double itemPrice;
  String? location;
  ProductItem({
    required this.itemImg,
    required this.itemPrice,
    required this.itemTitle,
    this.location,
  });
}

List<ProductItem> items = [
  ProductItem(
    itemTitle: 'Product 1',
    itemImg: 'assets/images/flower1.webp',
    itemPrice: 12.99,
    location: 'California',
  ),
  ProductItem(
    itemTitle: 'Product 2',
    itemImg: 'assets/images/flower2.webp',
    itemPrice: 20.99,
    location: 'Alaska',
  ),
  ProductItem(
    itemTitle: 'Product 3',
    itemImg: 'assets/images/flower3.webp',
    itemPrice: 10.99,
    location: 'Kansas',
  ),
  ProductItem(
    itemTitle: 'Product 4',
    itemImg: 'assets/images/flower4.webp',
    itemPrice: 30.99,
    location: 'Mississippi',
  ),
  ProductItem(
    itemTitle: 'Product 5',
    itemImg: 'assets/images/flower5.webp',
    itemPrice: 45.99,
    location: 'Texas',
  ),
  ProductItem(
    itemTitle: 'Product 6',
    itemImg: 'assets/images/flower6.webp',
    itemPrice: 33.99,
    location: 'Main Branch',
  ),
  ProductItem(
    itemTitle: 'Product 7',
    itemImg: 'assets/images/flower7.webp',
    itemPrice: 26.99,
    location: 'Main Branch',
  ),
  ProductItem(
    itemTitle: 'Product 8',
    itemImg: 'assets/images/flower8.webp',
    itemPrice: 18.99,
    location: 'New York',
  ),
  ProductItem(
    itemTitle: 'Product 9',
    itemImg: 'assets/images/flower9.jpg',
    itemPrice: 88.99,
    location: 'New York',
  ),
  ProductItem(
    itemTitle: 'Product 10',
    itemImg: 'assets/images/flower10.jpg',
    itemPrice: 90.99,
    location: 'Main Branch',
  ),
];
