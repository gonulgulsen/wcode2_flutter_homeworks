import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kişilik Anketi',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const SurveyPage(),
    );
  }
}

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final TextEditingController nameController = TextEditingController();
  String? selectedGender;
  bool isAdult = false;
  bool smokes = false;
  double cigaretteCount = 0;

  void sendData() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          name: nameController.text,
          gender: selectedGender ?? 'Seçilmedi',
          isAdult: isAdult,
          smokes: smokes,
          cigaretteCount: cigaretteCount.round(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kişilik Anketi"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
              onChanged: (value) => setState(() => selectedGender = value),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Reşit misiniz?"),
                Checkbox(
                  value: isAdult,
                  activeColor: Colors.deepOrange,
                  onChanged: (value) =>
                      setState(() => isAdult = value ?? false),
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
                  onChanged: (value) => setState(() {
                    smokes = value;
                    if (!smokes) cigaretteCount = 0;
                  }),
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
                    onChanged: (value) =>
                        setState(() => cigaretteCount = value),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: sendData,
              child: const Text(
                "Bilgileri Gönder",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String name;
  final String gender;
  final bool isAdult;
  final bool smokes;
  final int cigaretteCount;

  const ResultPage({
    super.key,
    required this.name,
    required this.gender,
    required this.isAdult,
    required this.smokes,
    required this.cigaretteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anket Sonuçları"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.orange.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ad Soyad: $name",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Cinsiyet: $gender", style: const TextStyle(fontSize: 18)),
                Text(
                  "Reşit mi: ${isAdult ? 'Evet' : 'Hayır'}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Sigara Kullanıyor mu: ${smokes ? 'Evet' : 'Hayır'}",
                  style: const TextStyle(fontSize: 18),
                ),
                if (smokes)
                  Text(
                    "Günlük Sigara Adedi: $cigaretteCount",
                    style: const TextStyle(fontSize: 18),
                  ),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 30,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Geri Dön",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
