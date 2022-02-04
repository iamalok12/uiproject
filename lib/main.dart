import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

enum RadioImages { pizza, burger, drink }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _editTextController = TextEditingController();
  RadioImages _images = RadioImages.pizza;
  final ScrollController _scrollController = ScrollController();
  Widget getImage() {
    if (_images == RadioImages.pizza) {
      return SizedBox(
        height: 80,
        width: 80,
        child: Image.network(
            "https://st.depositphotos.com/1003814/5052/i/950/depositphotos_50523105-stock-photo-pizza-with-tomatoes.jpg"),
      );
    } else if (_images == RadioImages.burger) {
      return SizedBox(
        height: 80,
        width: 80,
        child: Image.network(
            "https://media.istockphoto.com/photos/cheeseburger-with-tomato-and-lettuce-on-wooden-board-picture-id1309352410?s=2048x2048"),
      );
    } else {
      return SizedBox(
        height: 80,
        width: 80,
        child: Image.network(
            "https://www.bigbasket.com/media/uploads/p/xxl/40216379_1-pepsi-soft-drink.jpg"),
      );
    }
  }

  final List<String> countryList = ["India", "Africa",];
  List<String> stateList = [];
  List<String> cityList = [];
  String? country;
  String? state;

  String? city;
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Column(
                  children: [
                    const Text("Text input field with scrollbar"),
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey, width: 2),
                      ),
                      child: Center(
                        child: Scrollbar(
                          thickness: 20,
                          interactive: true,
                          controller: _scrollController,
                          isAlwaysShown: true,
                          child: TextField(
                            maxLines: 3,
                            controller: _editTextController,
                            scrollController: _scrollController,
                            autofocus: true,
                            keyboardType: TextInputType.multiline,
                            autocorrect: true,
                            onChanged: (s) => {},
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Text("Select food item"),
                      Row(
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text("Pizza"),
                                  leading: Radio(
                                    value: RadioImages.pizza,
                                    groupValue: _images,
                                    onChanged: (value) {
                                      setState(() {
                                        _images = (value as RadioImages?)!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text("Burger"),
                                  leading: Radio(
                                    value: RadioImages.burger,
                                    groupValue: _images,
                                    onChanged: (value) {
                                      setState(() {
                                        _images = (value as RadioImages?)!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: const Text("Drink"),
                                  leading: Radio(
                                    value: RadioImages.drink,
                                    groupValue: _images,
                                    onChanged: (value) {
                                      setState(() {
                                        _images = (value as RadioImages?)!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            width: 150,
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          SizedBox(child: getImage())
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Text("Address"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              iconSize: 30,
                              hint: Text(country == null
                                  ? "Choose country"
                                  : country.toString()),
                              underline: const Text(""),
                              items: countryList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  country = value;
                                  if(value=="India"){
                                    stateList=["Bihar", "Karnataka"];
                                  }
                                  else{
                                    stateList=["Nigeria"];
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              iconSize: 30,
                              hint: Text(state == null
                                  ? "Choose state"
                                  : state.toString()),
                              underline: const Text(""),
                              items: stateList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  state = value;
                                  if(value=="Bihar"){
                                    cityList=["Patna"];
                                  }
                                  else if(value=="Karnataka"){
                                    cityList=["Bangalore"];
                                  }
                                  else{
                                    cityList=["Lagos"];
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: DropdownButton<String>(
                              isExpanded: true,
                              iconSize: 30,
                              hint: Text(city == null
                                  ? "Choose city"
                                  : city.toString()),
                              underline: const Text(""),
                              items: cityList.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  city = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Text("Tooltip"),
                      Tooltip(
                        message: 'This is a Tool Tip button',
                        child: IconButton(
                          icon: const Icon(Icons.help),
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2),
                  ),
                  child: Column(
                    children: [
                      const Text("Rating"),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(border: Border.all()),
                            width: 100,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  rating = double.parse(value);
                                });
                              },
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
