import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

final people = [
  Person(name: "John", age: 20, emoji: "🙍"),
  Person(name: "Aimée", age: 25, emoji: "🧗"),
  Person(name: "Martin", age: 30, emoji: "⛹")
];

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          title: Text(
            "People",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            final person = people[index];
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(person: person);
                  },
                ));
              },
              title: Text(person.name),
              subtitle: Text("${person.age} years"),
              leading: Hero(
                tag: person.name,
                child: Text(
                  person.emoji,
                  style: TextStyle(fontSize: 40),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          },
        ));
  }
}

class DetailsPage extends StatelessWidget {
  final Person person;

  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Hero(
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              switch (flightDirection) {
                case HeroFlightDirection.push:
                  return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                      scale: animation
                          .drive(Tween<double>(begin: 0.0, end: 1.0).chain(
                        CurveTween(curve: Curves.fastOutSlowIn),
                      )),
                      child: toHeroContext.widget,
                    ),
                  );
                case HeroFlightDirection.pop:
                  return Material(
                    color: Colors.transparent,
                    child: fromHeroContext.widget,
                  );
              }
            },
            tag: person.name,
            child: Text(
              person.emoji,
              style: TextStyle(fontSize: 50),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                person.name,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "${person.age} years",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
