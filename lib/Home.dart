import 'package:bmicalculator/Brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndialog/ndialog.dart';

const activeCardColour = Color(0XFF1B004B);
const inactiveCardColour = Color(0XFF120030);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;
  double _value1 = 50.0;
  int weight = 10;
  int age = 01;

  void updateColor(int position) {
    if (position == 1) {
      maleCardColor = activeCardColour;
      femaleCardColor = inactiveCardColour;
    }
    if (position == 2) {
      maleCardColor = inactiveCardColour;
      femaleCardColor = activeCardColour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text(
          "BMI Calculator",
          textAlign: TextAlign.center,
          style: GoogleFonts.comfortaa(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(1);
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icons: FontAwesomeIcons.mars,
                      text: "Male",
                    ),
                    colour: maleCardColor,
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColor(2);
                  });
                },
                child: ReusableCard(
                  cardChild: IconContent(
                    icons: FontAwesomeIcons.venus,
                    text: "Female",
                  ),
                  colour: femaleCardColor,
                ),
              )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    "Height",
                    style: GoogleFonts.comfortaa(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 120.0,
                  ),
                  Text(
                    _value1.round().toString(),
                    textAlign: TextAlign.end,
                    style: GoogleFonts.comfortaa(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " cm",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 35.0,
              ),
              FluidSlider(
                value: _value1,
                sliderColor: activeCardColour,
                onChanged: (double newValue) {
                  setState(() {
                    _value1 = newValue;
                  });
                },
                min: 50.0,
                max: 250.0,
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Weight",
                      style: GoogleFonts.comfortaa(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          weight.toString(),
                          style: GoogleFonts.comfortaa(
                              fontSize: 80,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "kg",
                          style: GoogleFonts.comfortaa(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          child: Icon(Icons.arrow_upward),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            setState(() {
                              weight--;
                              if (weight < 1) {
                                weight = 1;
                              }
                            });
                          },
                          child: Icon(Icons.arrow_downward),
                        ),
                      ],
                    )
                  ],
                ),
                colour: activeCardColour,
              )),
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Age",
                      style: GoogleFonts.comfortaa(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      age.toString(),
                      style: GoogleFonts.comfortaa(
                          fontSize: 80,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: Colors.greenAccent,
                          onPressed: () {
                            setState(() {
                              age--;
                              if (age < 1) {
                                age = 1;
                              }
                            });
                          },
                          child: Icon(Icons.remove),
                        ),
                      ],
                    )
                  ],
                ),
                colour: activeCardColour,
              )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Brain brain = Brain(finalheight: _value1, finalWeignt: weight);

            String val = brain.BMIValue();
            String text = brain.BMIResult();
            String message = brain.BMIMessage();

            showDialog(
                context: context,
                builder: (context) {
                  return BlurDialogBackground(
                    blur: 5,
                    dialog: Container(
                      padding: EdgeInsets.all(30.0),
                      height: 350.0,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Result",
                            style: GoogleFonts.comfortaa(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            val,
                            style: GoogleFonts.comfortaa(
                                fontSize: 80,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            text,
                            style: GoogleFonts.comfortaa(
                                fontSize: 20,
                                color: Colors.teal,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Expanded(
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.comfortaa(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0XFFA3586D),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                "Calculate",
                style: GoogleFonts.comfortaa(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IconContent extends StatelessWidget {
  IconContent({@required this.icons, this.text});

  final IconData icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icons,
          size: 120.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.comfortaa(
              fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  ReusableCard({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
