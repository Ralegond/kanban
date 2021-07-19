abstract class CardEvents {}

class CardGetEvent extends CardEvents {
  final row;
  CardGetEvent({required this.row});
}
