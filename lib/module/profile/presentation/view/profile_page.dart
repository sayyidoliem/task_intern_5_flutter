import 'package:task_intern_5_flutter/import.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: UserStorage.getUser(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  // TODO Put user from login response to this section
                  return const Text('User',
                      style: TextStyle(fontWeight: FontWeight.bold));
                } else {
                  return Text(
                    snapshot.data!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  );
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email: ',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                FutureBuilder(
                  future: UserStorage.getEmail(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Text('-',
                          style: TextStyle(fontWeight: FontWeight.bold));
                    } else {
                      //TODO the phone result is empty, cek the response again
                      return Text(snapshot.data,
                          style: Theme.of(context).textTheme.titleLarge!);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phone Number : ',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                FutureBuilder(
                  future: UserStorage.getPhone(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Text('-',
                          style: TextStyle(fontWeight: FontWeight.bold));
                    } else {
                      return Text(snapshot.data,
                          style: Theme.of(context).textTheme.titleLarge!);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 64, right: 16, left: 16),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.login);
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0.25,
                backgroundColor: const Color(0xFFB22727)),
            child: Text(
              'LOGOUT',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold)
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
