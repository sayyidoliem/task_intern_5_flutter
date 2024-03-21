import 'package:task_intern_5_flutter/import.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    DashboardCubit myDashboardBloc = DashboardCubit(DashboardService())
      ..onDashboardLoaded();
    return BlocBuilder<DashboardCubit, DashboardState>(
      bloc: myDashboardBloc,
      builder: (context, state) {
        if (state is DashBoardLoading) {
          return const CircularProgressIndicator();
        }
        if (state is DashBoardSuccess) {
          final articleData = state.articleList;
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    const Text('Welcome, '),
                    FutureBuilder(
                      future: UserStorage.getUser(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const Text('user',
                              style: TextStyle(fontWeight: FontWeight.bold));
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              snapshot.data!,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
                automaticallyImplyLeading: false,
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.profile);
                      },
                      icon: const Icon(Icons.person))
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(14.0),
                      itemBuilder: (context, index) {
                        final articleResult = articleData[index];
                        return CardDashboard(
                            title: articleResult.title,
                            subTitle: articleResult.content);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final articleResult = articleData[index];
                        DateTime date =
                                DateTime.parse(articleResult.created!.date);
                            // String formattedDate =
                            //     DateFormat('d MMMM yyyy, HH:mm:ss').format(date);
                            String formattedDate = '${date.day} ${date.month} ${date.year}';
                        return Card(
                          color: const Color.fromRGBO(0, 238, 255, 0.149),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 8.0),
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
                                    articleResult.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0),
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
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400),
                                ),
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
                    ),
                  )
                ],
              ),
            ),
          );
        }
        if (state is DashBoardError) {
          return const ErrorPage();
        } else {
          return const Center(
            child: Text("null"),
          );
        }
      },
    );
  }
}
