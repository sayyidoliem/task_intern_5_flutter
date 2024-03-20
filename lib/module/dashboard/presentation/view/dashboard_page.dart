import 'package:task_intern_5_flutter/import.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String title = "User";
  String subTitle = "Desc";
  String date = '12-34-5678';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Welcome, '),
            Text(
              'User',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {
          Navigator.pushNamed(context, RouteName.profile);
        }, icon: const Icon(Icons.person))],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CardDashboard(title: title, subTitle: subTitle),
                CardDashboard(title: title, subTitle: subTitle),
                CardDashboard(title: title, subTitle: subTitle),
                CardDashboard(title: title, subTitle: subTitle),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Card(
              color: const Color.fromRGBO(0, 238, 255, 0.149),
              margin:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: Image.network(
                          'https://dummyjson.com/image/150',
                        ),
                      ),
                      title: Text(
                        title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(subTitle,
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w400)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        date,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
