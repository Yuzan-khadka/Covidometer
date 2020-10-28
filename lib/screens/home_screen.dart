import 'package:covidometer/services/country_name.dart';
import 'package:covidometer/services/networking.dart';
import 'package:covidometer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String totalCasesNumber;
  String newCasesNumber;
  String activeCasesNumber;
  String criticalCasesNumber;
  String recoveredNumber;
  String newDeathsNumber;
  String totalDeathsNumber;
  String countryName;
  String countryFlag;

  @override
  Widget build(BuildContext context) {
    //String searchedName = Provider.of<CountryName>(context).defaultName;
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([
          Networking().getData(context),
          Networking().getFlag(context)

          //DefaultAssetBundle.of(context).loadString('assets/json/country.json')
        ]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            var data = snapshot.data[0];
            var flag = snapshot.data[1];

            String searchedName = Provider.of<CountryName>(context).defaultName;

            // for (var countryData in country) {
            //   if (countryData['name'].toString() == searchedName) {
            //     countryCode = countryData['code'].toString().toLowerCase();
            //   }
            // }

            countryName = data['response'][0]['country'].toString();
            countryFlag = flag[0]['flag'];
            print(countryFlag);

            var totalCases = data['response'][0]['cases']['total'];
            totalCasesNumber = totalCases.toString();

            var newCases = data['response'][0]['cases']['new'];
            newCasesNumber = newCases.toString();

            var activeCases = data['response'][0]['cases']['active'];
            activeCasesNumber = activeCases.toString();

            var criticalCases = data['response'][0]['cases']['critical'];
            criticalCasesNumber = criticalCases.toString();

            var recovered = data['response'][0]['cases']['recovered'];
            recoveredNumber = recovered.toString();

            var newDeathsCases = data['response'][0]['deaths']['new'];
            newDeathsNumber = newDeathsCases.toString();

            var totalDeathsCases = data['response'][0]['deaths']['total'];
            totalDeathsNumber = totalDeathsCases.toString();

            return SafeArea(
              child: CustomScrollView(
                slivers: [
                  CustomAppBar(),
                  SliverPadding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          (searchedName == 'All' || searchedName == 'all')
                              ? Container(
                                  height: 100.0,
                                  child: SvgPicture.asset(
                                      'assets/images/globe.svg'),
                                )
                              : (searchedName == 'Nepal' ||
                                      searchedName == 'nepal')
                                  ? Container(
                                      height: 100.0,
                                      child: SvgPicture.asset(
                                          'assets/images/nepal.svg'),
                                    )
                                  : Container(
                                      height: 100.0,
                                      child: SvgPicture.network(
                                        countryFlag,
                                      ),
                                    ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            countryName == 'All' || countryName == 'all'
                                ? 'World'
                                : countryName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CasesList(
                            totalCasesNumber: totalCasesNumber,
                            newCasesNumber: newCasesNumber,
                            activeCasesNumber: activeCasesNumber,
                            criticalCasesNumber: criticalCasesNumber,
                            recoveredNumber: recoveredNumber,
                            newDeathsNumber: newDeathsNumber,
                            totalDeathsNumber: totalDeathsNumber,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
