import 'package:e_commerce_app/Other%20Stuff/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Classes/random_items.dart';
import 'Other Stuff/app_theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _search = TextEditingController();
  final List<RandomItems> _searchResult = [];

  final _randomItems = [
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
    RandomItems(
        name: "HP Laptop x464",
        image:
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-blue-business-technology-smart-office-electronics-png-image_4886368.jpg",
        price: "Rs. 80,400",
        category: "Laptop"),
  ];

  Widget _buildUsersList() {
    var style = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    var pStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return ListView.builder(
      itemCount: _randomItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                _randomItems[index].image,
              ),
            ),
            title: Text(
              _randomItems[index].name,
              style: style,
            ),
            trailing: Text(
              _randomItems[index].price,
              style: pStyle.copyWith(color: Colors.red),
            ),
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchResults() {
    var style = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    var pStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, i) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                _searchResult[i].image,
              ),
            ),
            title: Text(
              _searchResult[i].name,
              style: style,
            ),
            trailing: Text(
              _searchResult[i].price,
              style: pStyle.copyWith(color: Colors.red),
            ),
          ),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.search,
            ),
          ),
          title: TextFormField(
            controller: _search,
            keyboardType: TextInputType.text,
            cursorColor: const Color(0xff0588BC),
            style: AppTheme.splashStyle.copyWith(fontSize: 15),
            decoration: InputDecoration(
              errorStyle: AppTheme.splashStyle.copyWith(fontSize: 14),
              hintText: 'Search',
              labelStyle: AppTheme.splashStyle.copyWith(fontSize: 14),
            ),
            onChanged: onSearchTextChanged,
            validator: (val) => val.isEmpty ? "Empty" : null,
          ),
          trailing: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.times,
            ),
            onPressed: () {
              _search.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Container(color: Colors.transparent, child: _buildSearchBox()),
        Expanded(
            child: _searchResult.isNotEmpty || _search.text.isNotEmpty
                ? _buildSearchResults()
                : _buildUsersList()),
      ],
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (var random in _randomItems) {
      if (random.name.contains(text) || random.name.contains(text)) {
        _searchResult.add(random);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customized.appBar("Search"),
      body: _buildBody(),
    );
  }
}
