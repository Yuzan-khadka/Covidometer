import 'package:covidometer/services/country_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController textController = TextEditingController();
  bool isSearchBarOpen = false;
  bool isCountryNameValid = true;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: isSearchBarOpen ? 130.0 : null,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.info_outline,
            color: Theme.of(context).accentColor,
          )),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isSearchBarOpen = true;
            });
            if (isSearchBarOpen == true) {
              if (textController.text.isNotEmpty) {
                String searchedCountryName = textController.text;
                Provider.of<CountryName>(context, listen: false)
                    .changeName(searchedCountryName);
              }
            }
          },
          icon: Icon(
            Icons.search,
            color: Theme.of(context).accentColor,
          ),
        ),
        isSearchBarOpen == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSearchBarOpen = false;
                    textController.clear();
                  });
                },
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.highlight_off),
              )
            : SizedBox.shrink(),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'COVIDOMETER',
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
        background: isSearchBarOpen
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  controller: textController,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10.0),
                    hintText: 'Enter a country name',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
        centerTitle: true,
      ),
    );
  }
}
