
class Sinario {
  final String image, title;
  final int id;

  Sinario({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<Sinario> sinarios = [
  Sinario(
    id: 1,
    image: "asset/images/college.png",
    title: "Classroom",
  ),

  Sinario(
    id: 2,
    image: "asset/images/coffee-shop.png",
    title: "Cafe",
  ),

  Sinario(
    id: 3,
    image: "asset/images/bus-stop.png",
    title: "Bus Station",
  ),

  Sinario(
    id: 4,
    image: "asset/images/restaurant.png",
    title: "Restaurant",
  ),

  Sinario(
    id: 5,
    image: "asset/images/available_soon.png",
    title: "",
  ),
];