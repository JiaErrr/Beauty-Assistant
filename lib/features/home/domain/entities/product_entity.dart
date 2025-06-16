class ProductEntity {
  final String id;
  final String brand;
  final String name;
  final int likes;
  final String? imageUrl;

  const ProductEntity({
    required this.id,
    required this.brand,
    required this.name,
    required this.likes,
    this.imageUrl,
  });
}