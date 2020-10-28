import 'package:covidometer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CasesList extends StatelessWidget {
  final String totalCasesNumber;
  final String newCasesNumber;
  final String activeCasesNumber;
  final String criticalCasesNumber;
  final String recoveredNumber;
  final String newDeathsNumber;
  final String totalDeathsNumber;

  CasesList({
    this.activeCasesNumber,
    this.criticalCasesNumber,
    this.newCasesNumber,
    this.newDeathsNumber,
    this.recoveredNumber,
    this.totalCasesNumber,
    this.totalDeathsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReusableCard(
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Cases',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/total_cases.svg'),
                    Text(
                      totalCasesNumber.replaceAllMapped(
                          new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                          (Match m) => '${m[1]},'),
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  content: CardContent(
                    label: 'New Cases',
                    assetPath: 'assets/images/new_cases.svg',
                    casesNumber: newCasesNumber.replaceAllMapped(
                        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ReusableCard(
                  content: CardContent(
                    label: 'Active Cases',
                    assetPath: 'assets/images/active_cases.svg',
                    casesNumber: activeCasesNumber.replaceAllMapped(
                        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  content: CardContent(
                    label: 'Critical Cases',
                    assetPath: 'assets/images/critical_cases.svg',
                    casesNumber: criticalCasesNumber.replaceAllMapped(
                        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ReusableCard(
                  content: CardContent(
                    label: 'Recovered',
                    assetPath: 'assets/images/recovered.svg',
                    casesNumber: recoveredNumber.replaceAllMapped(
                        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  content: CardContent(
                    label: 'New Deaths',
                    assetPath: 'assets/images/new_deaths.svg',
                    casesNumber: newDeathsNumber.replaceAllMapped(
                        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ReusableCard(
                  content: CardContent(
                    label: 'Total Deaths',
                    assetPath: 'assets/images/total_deaths.svg',
                    casesNumber: totalDeathsNumber.replaceAllMapped(
                        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
