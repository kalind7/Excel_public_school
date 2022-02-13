class Books {
  final String image;
  final String title;
  final String author;
  final int price;
  final Function onpress;

  Books(
      {required this.image,
      required this.title,
      required this.price,
      required this.author,
        required this.onpress,
      });
}
