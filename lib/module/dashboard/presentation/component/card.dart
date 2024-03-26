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
            // TODO fix the typography
            //done
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(4, 131, 141, 1)),
            ),
            const SizedBox(
              height: 4,
            ),
            // TODO add the typography
            //done
            Text(
              subTitle,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
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
        var idMonth = date.month - 1;
        String formattedDate =
            '${date.day} ${month[idMonth]} ${date.year}, ${date.hour}:${date.minute}:${date.second}';
        return Card(
          color: const Color.fromRGBO(0, 238, 255, 0.149),
          //TODO Fix the space
          //done
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                        // TODO fontweight not bold see in figma again
                        //done
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0),
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
                    //TODO fix the formatdate
                    //done
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
