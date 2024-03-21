import 'package:task_intern_5_flutter/import.dart';

class CardDashboard extends StatelessWidget {
  const CardDashboard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(4, 131, 141, 0.242)),
              ),
              Text(
                subTitle,
                maxLines: 8,
                overflow: TextOverflow.fade,
              )
            ],
          ),
        ),
      ),
    );
  }
}
