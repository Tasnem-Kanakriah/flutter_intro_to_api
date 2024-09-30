import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intro_to_api/Models/cat_model.dart';
import 'package:intro_to_api/services/cat_service.dart';

class CatPageWithModel extends StatefulWidget {
  const CatPageWithModel({super.key});

  @override
  State<CatPageWithModel> createState() => _CatPageWithModelState();
}

class _CatPageWithModelState extends State<CatPageWithModel> {
  TextEditingController nameFromTextField = TextEditingController();
  TextEditingController colorFromTextField = TextEditingController();
  TextEditingController imageFromTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: getDataOfCat(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    color: const Color(0xFFC3BBF0),
                    height: 600,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                            child: ListTile(
                              leading: Image.network(
                                width: 60,
                                height: 60,
                                snapshot.data![index].image,
                              ),
                              title: Text(snapshot.data![index].name),
                              subtitle: Text(snapshot.data![index].color),
                            ),
                          );
                        }),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: nameFromTextField,
                      decoration: const InputDecoration(
                        hintText: "Enter The Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: colorFromTextField,
                      decoration: const InputDecoration(
                        hintText: "Enter The Color",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: imageFromTextField,
                      decoration: const InputDecoration(
                        hintText: "Enter The Image URL",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
          onTap: () {
            createNewCat(
              name: nameFromTextField.text,
              color: colorFromTextField.text,
              image: imageFromTextField.text,
            );
            setState(() {});
          },
          child: const Icon(
            Icons.add_circle_outline,
            size: 50,
          )),
    );
  }
}

createNewCat(
    {required String name,
    String color = 'Syria',
    String image =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4Inf60l0egQ8i49C_lylZJl90NVuPLWmG7Q&s'}) async {
  Dio request = Dio();
  CatModel cat = CatModel(name: name, color: color, image: image);

  await request.post('https://66f5970d436827ced9747ae1.mockapi.io/cat',
      data: cat.fromObjectToMap());
}
