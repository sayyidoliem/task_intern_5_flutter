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
    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        width: 210,
        height: 190,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromRGBO(4, 132, 141, 1)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(4, 131, 141, 1)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              subTitle,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}

class CardDashboardArticle extends StatelessWidget {
  const CardDashboardArticle({
    super.key,
    required this.articleData,
  });

  final List<DashBoard> articleData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final articleResult = articleData[index];
        DateTime date = DateTime.parse(articleResult.created!.date);
        // String formattedDate =
        //     DateFormat('d MMMM yyyy, HH:mm:ss').format(date);
        String formattedDate = '${date.day} ${date.month} ${date.year}';
        return Card(
          color: const Color.fromRGBO(0, 238, 255, 0.149),
          margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: SizedBox(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        articleResult.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Text(
                    articleResult.title.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  articleResult.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
