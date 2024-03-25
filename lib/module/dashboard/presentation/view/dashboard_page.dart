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
          return const Scaffold(body: DashboardLoadingPage());
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(14.0),
                      itemBuilder: (context, index) {
                        final articleResult = articleData[index];
                        return CardDashboard(
                            title: articleResult.title,
                            subTitle: articleResult.content);
                      },
                      itemCount: articleData.length,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CardDashboardArticle(articleData: articleData),
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