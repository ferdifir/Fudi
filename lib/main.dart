import 'package:flutter/material.dart';
import 'package:fudi/image_slider.dart';

void main() {
  runApp(const FudiApp());
}

class FudiApp extends StatelessWidget {
  const FudiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fudi - Food Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedMenuIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ListTile(
                  title: const SelectableText('Home'),
                  leading: const Icon(Icons.explore_outlined),
                  tileColor: selectedMenuIndex == 0
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : null,
                  onTap: () {
                    setState(() {
                      selectedMenuIndex = 0;
                    });
                  },
                ),
                ListTile(
                  title: const SelectableText('Favourites'),
                  leading: const Icon(Icons.favorite_border_outlined),
                  tileColor: selectedMenuIndex == 1
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : null,
                  onTap: () {
                    setState(() {
                      selectedMenuIndex = 1;
                    });
                  },
                ),
                ListTile(
                  title: const SelectableText('Profile'),
                  leading: const Icon(Icons.person_outline_outlined),
                  tileColor: selectedMenuIndex == 2
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                      : null,
                  onTap: () {
                    setState(() {
                      selectedMenuIndex = 2;
                    });
                  },
                ),
                const Spacer(),
                ListTile(
                  title: const SelectableText('Logout'),
                  leading: const Icon(Icons.logout_outlined),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_alt_outlined),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: ListView(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const ImageSliderWithIndicator(
                            imageUrls: [
                              'https://picsum.photos/200/300',
                              'https://picsum.photos/200/300',
                              'https://picsum.photos/200/300',
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const DefaultTabController(
                          length: 5,
                          child: TabBar(
                            tabs: [
                              Tab(text: 'All'),
                              Tab(text: 'Food'),
                              Tab(text: 'Snack'),
                              Tab(text: 'Drink'),
                              Tab(text: 'Dessert'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        'https://picsum.photos/200/300',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SelectableText(
                                            'Pizza',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SelectableText('Rp. 20.000'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'My Order',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10.0),
                SelectableText(
                  'Delivery Address',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ListTile(
                  title: const SelectableText('Jl. Raya Bogor'),
                  subtitle: const SelectableText('Bogor, Jawa Barat'),
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.location_on_outlined),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/200',
                          ),
                        ),
                        title: const SelectableText('Pizza'),
                        subtitle: const SelectableText('Rp. 20.000'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            const SelectableText('1'),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                        contentPadding: EdgeInsets.zero,
                      );
                    },
                  ),
                ),
                const ExpansionTile(
                  title: SelectableText('Total'),
                  subtitle: SelectableText('Rp. 20.000'),
                  children: [
                    ListTile(
                      title: SelectableText('Subtotal'),
                      trailing: SelectableText('Rp. 20.000'),
                      contentPadding: EdgeInsets.zero,
                    ),
                    ListTile(
                      title: SelectableText('Delivery Fee'),
                      trailing: SelectableText('Rp. 0'),
                      contentPadding: EdgeInsets.zero,
                    ),
                    ListTile(
                      title: SelectableText('Tax'),
                      trailing: SelectableText('Rp. 0'),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50.0),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  child: const SelectableText('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
