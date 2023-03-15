import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

// List<String> images = [
//   assets.images[0],
//   assets.images[1],
//   assets.images[2],
// ];
class DashboardOnePage extends StatelessWidget {
  // static final String path = "lib/src/pages/dashboard/dash1.dart";

  final String image = "assets/doctor01.jpg";

  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final legendLabels = <String, String>{
    "Cardio": "Cardiology Specialist",
    "Neurology": "Neurology Specialist",
    "Orthopedic": "Orthopedic Specialist",
    "Eye": "Eye Specialist",
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  ChartType? _chartType = ChartType.disc;
  bool _showCenterText = true;
  double? _ringStrokeWidth = 32;
  double? _chartLegendSpacing = 32;

  bool _showLegendsInRow = false;
  bool _showLegends = true;
  bool _showLegendLabel = false;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = false;
  bool _showChartValuesOutside = false;

  bool _showGradientColors = false;

  // LegendShape _legendShape = LegendShape.circle;
  LegendPosition? _legendPosition = LegendPosition.right;

  // int key = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      chartRadius: 200,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      centerText: _showCenterText ? "Department" : null,
      legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: BoxShape.circle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
      gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );

    const TextStyle stats = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white);
    const TextStyle style2 = TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        color: Colors.white,
        fontStyle: FontStyle.normal);
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "+500",
                    style: stats,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "Leads".toUpperCase(),
                    style: style2,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.pink,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "+300",
                    style: stats,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "Customers".toUpperCase(),
                    style: style2,
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.5,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.green,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "+1200",
                    style: stats,
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    "Orders".toUpperCase(),
                    style: style2,
                  )
                ],
              ),
            ),
          ]),
        ),
        chart,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: _buildTitledContainer(
            "Activities",
            height: 280,
            child: Expanded(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: activities
                    .map(
                      (activity) => Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: activity.icon != null
                                ? Icon(
                                    activity.icon,
                                    size: 18.0,
                                  )
                                : null,
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            activity.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: _buildTitledContainer("Sales",
        //         child: SizedBox(
        //             height: 300, child: DonutPieChart.withSampleData())),
        //   ),
        // ),
        // _buildActivities(context),
      ],
    );
  }

  SliverPadding _buildStats() {
    final TextStyle stats = const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white);
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.8,
        crossAxisCount: 3,
      ),
    );
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildTitledContainer("Stats",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "+500",
                      style: stats,
                    ),
                    const SizedBox(height: 5.0),
                    Text("Leads".toUpperCase())
                  ],
                ),
                const SizedBox(width: 20.0),
                const SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Text(
                      "+600",
                      style: stats,
                    ),
                    const SizedBox(height: 5.0),
                    Text("Orders".toUpperCase())
                  ],
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Text(
                      "+100",
                      style: stats,
                    ),
                    const SizedBox(height: 5.0),
                    Text("Deliveries".toUpperCase())
                  ],
                ),
              ],
            )),
      ),
    );
  }

  SliverPadding _buildActivities(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: _buildTitledContainer(
          "Activities",
          height: 280,
          child: Expanded(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: activities
                  .map(
                    (activity) => Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: activity.icon != null
                              ? Icon(
                                  activity.icon,
                                  size: 18.0,
                                )
                              : null,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          activity.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20.0)),
              height: 200,
              foregroundDecoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Good Afternoon".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Take a glimpses at your dashboard",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      titleSpacing: 0.0,
      elevation: 0.5,
      backgroundColor: Colors.white,
      title: const Text(
        "Dashboard",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[_buildAvatar(context)],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return IconButton(
      iconSize: 40,
      padding: const EdgeInsets.all(0),
      icon: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: const CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/person.jpg')),
      ),
      onPressed: () {},
    );
  }

  Container _buildTitledContainer(String title,
      {required Widget child, double? height}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
          ),
          if (child != null) ...[const SizedBox(height: 10.0), child]
        ],
      ),
    );
  }
}

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {required this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: charts.ArcRendererConfig(
            arcWidth: 60, arcRendererDecorators: [charts.ArcLabelDecorator()]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      new LinearSales("July", 100),
      new LinearSales("August", 75),
      new LinearSales("September", 25),
      new LinearSales("October", 5),
    ];

    return [
      charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String month;
  final int sales;

  LinearSales(this.month, this.sales);
}

class Activity {
  final String title;
  final IconData icon;

  Activity({required this.title, required this.icon});
}

final List<Activity> activities = [
  Activity(title: "Results", icon: FontAwesomeIcons.listOl),
  Activity(title: "Messages", icon: FontAwesomeIcons.commentSms),
  Activity(title: "Appointments", icon: FontAwesomeIcons.calendarDay),
  Activity(title: "Video Consultation", icon: FontAwesomeIcons.video),
  Activity(title: "Summary", icon: FontAwesomeIcons.fileLines),
  Activity(title: "Billing", icon: FontAwesomeIcons.dollarSign),
];
