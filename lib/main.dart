import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'layout example',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Padding titleSection = Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue, // 파란색 테두리 색상
            width: 4, // 테두리 두께
          ),
          borderRadius: BorderRadius.circular(8), // 테두리의 모서리를 둥글게 설정
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '아스파라거스토마토구이 & 아스파라거스마늘볶음',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '맛남의 광장에서 나온 아스파라거스요리!\n'
                  '입에 감기는 맛이지만, 쉬운 요리법에\n'
                  '술안주, 밥반찬으로 추천!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );

    Widget iconSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildIconLabelRow(Icons.people, '4인분', Colors.grey),
        buildIconLabelRow(Icons.timer_outlined, '15분내', Colors.green),
        buildIconLabelRow(Icons.star, '아무나', Colors.red),
      ],
    );

    Widget stepSection = Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '조리순서',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "1",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  '[아스파라거스 토마토 구이] 아스파라거스는 4~5cm 길이로 자른다.',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Image.asset(
                'assets/knife.jpeg',
                width: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.contain,
              ),
            ],
          ),
          buildIconLabelRow(
              Icons.lightbulb, '굵기가 얇은 아스파라거스를 사용해도 좋아요', Colors.teal),
          buildIconLabelRow(
              Icons.shopping_cart, '라오메뜨 천연세라믹 양면도마', Colors.grey),
        ],
      ),
    );

    return Scaffold(

      appBar: AppBar(
        title: Text('Recipe Example'),
        backgroundColor: Colors.blue[200],
        actions: [
          Icon(Icons.settings),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.asset('assets/food.jpg'),

          titleSection,
          iconSection,
          stepSection,
        ],
      ),
    );
  }

  Row buildIconLabelRow(IconData icon, String label, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 16, color: color, fontWeight: FontWeight.w400),
            )),
      ],
    );
  }
}
