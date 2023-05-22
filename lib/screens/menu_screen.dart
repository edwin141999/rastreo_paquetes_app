import 'package:flutter/material.dart';
import 'package:rastreo_paquetes_app/styles/colors/colors.view.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var categories = ['Actual', 'Pasado'];
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 0);
  int activeScroll = 0;
  final PageController _pageController = PageController(initialPage: 0);
  int activePage = 0;

  @override
  void initState() {
    activePage = 0;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset('assets/logo.png', height: 100),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu, color: Colors.black, size: 30),
                  ),
                  const Text(
                    'Envios',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(Icons.search, color: Colors.black, size: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 60),
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 100);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            activeScroll = index;
                            if (activePage == 0) {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            } else if (activePage == 1) {
                              _pageController.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            }
                          });
                        },
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: activeScroll == index &&
                                    categories[index] == 'Actual'
                                ? ColorSelect.kColorPrimary
                                : activeScroll == index &&
                                        categories[index] == 'Pasado'
                                    ? ColorSelect.kColorSecondary
                                    : Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(3),
                        width: MediaQuery.of(context).size.width * .2,
                        height: 2,
                        decoration: BoxDecoration(
                          color: activeScroll == index &&
                                  categories[index] == 'Actual'
                              ? ColorSelect.kColorPrimary
                              : activeScroll == index &&
                                      categories[index] == 'Pasado'
                                  ? ColorSelect.kColorSecondary
                                  : Colors.transparent,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .62,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    activeScroll = index;
                    activePage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 30);
                    },
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, snapshot) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        height: 80,
                        decoration: BoxDecoration(
                          color: activePage == index &&
                                  categories[index] == 'Actual'
                              ? ColorSelect.kColorPrimary
                              : activePage == index &&
                                      categories[index] == 'Pasado'
                                  ? ColorSelect.kColorSecondary
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Icon(
                              activePage == index &&
                                      categories[index] == 'Actual'
                                  ? Icons.watch_later
                                  : activePage == index &&
                                          categories[index] == 'Pasado'
                                      ? Icons.done
                                      : Icons.done,
                              color: Colors.white,
                              size: 30,
                            ),
                            const SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Mercado Libre',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'FedEx',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  activePage == index &&
                                          categories[index] == 'Actual'
                                      ? 'Esperando actualizaciones del operador'
                                      : activePage == index &&
                                              categories[index] == 'Pasado'
                                          ? 'Entregado el 12/05/23  a las 02:00 pm'
                                          : 'Entregado el 12/05/23  a las 02:00 pm',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.add, color: ColorSelect.kBlack, size: 40),
      ),
    );
  }
}
