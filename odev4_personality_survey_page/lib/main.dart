import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonalitySurveyPage(),
    );
  }
}

class PersonalitySurveyPage extends StatefulWidget {
  const PersonalitySurveyPage({super.key});

  @override
  State<PersonalitySurveyPage> createState() => _PersonalitySurveyPageState();
}

class _PersonalitySurveyPageState extends State<PersonalitySurveyPage> {
  final TextEditingController nameController = TextEditingController();
  String? selectedGender;
  bool isAdult = false;
  bool smokes = false;
  double cigaretteCount = 0;
  bool showResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişilik Anketi"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Adınız ve Soyadınız",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cinsiyetinizi Seçiniz",
              ),
              value: selectedGender,
              items: const [
                DropdownMenuItem(value: "Kadın", child: Text("Kadın")),
                DropdownMenuItem(value: "Erkek", child: Text("Erkek")),
                DropdownMenuItem(value: "Diğer", child: Text("Diğer")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Reşit misiniz?"),
                Checkbox(
                  value: isAdult,
                  activeColor: Colors.deepOrange,
                  onChanged: (value) {
                    setState(() {
                      isAdult = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sigara kullanıyor musunuz?"),
                Switch(
                  value: smokes,
                  activeColor: Colors.deepOrange,
                  onChanged: (value) {
                    setState(() {
                      smokes = value;
                      if (!smokes) cigaretteCount = 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            if (smokes)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Günde kaç tane sigara kullanıyorsunuz?"),
                  Slider(
                    value: cigaretteCount,
                    min: 0,
                    max: 40,
                    divisions: 40,
                    label: cigaretteCount.round().toString(),
                    activeColor: Colors.deepOrange,
                    onChanged: (value) {
                      setState(() {
                        cigaretteCount = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                setState(() {
                  showResult = true;
                });
              },
              child: const Text(
                "Bilgileri Gönder",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            if (showResult)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ad Soyad: ${nameController.text}"),
                    Text("Cinsiyet: ${selectedGender ?? 'Seçilmedi'}"),
                    Text("Reşit mi: ${isAdult ? 'Evet' : 'Hayır'}"),
                    Text("Sigara Kullanıyor mu: ${smokes ? 'Evet' : 'Hayır'}"),
                    if (smokes)
                      Text("Günlük sigara adedi: ${cigaretteCount.round()}"),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
