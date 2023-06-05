import 'package:expand_exmpl/details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double collapsedHeight = height * 0.15;
    double expandedHeight = height * 0.4;

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(top: 32),
            width: width * 0.8,
            height: isExpanded ? expandedHeight : collapsedHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFFD4E2), Color(0xffFF8FB3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(DetailsPage.routeName),
                          child: const Text(
                            'Go to details page',
                            style: TextStyle(
                                fontSize: 16, fontFamily: 'Gilroy Medium'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Icon(isExpanded
                              ? Icons.arrow_upward_outlined
                              : Icons.arrow_downward_rounded),
                        ),
                      ],
                    ),
                  ),
                  isExpanded
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Divider(),
                        )
                      : Container(),
                  isExpanded
                      ? const Center(
                          child: Text('Content here'),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
