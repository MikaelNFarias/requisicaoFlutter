import 'package:flutter/material.dart';
import 'package:random_user/models/measurement_model.dart';
import 'package:random_user/services/measurement_service.dart';

class MeasurementPage extends StatefulWidget {
  const MeasurementPage({super.key});

  @override
  State<MeasurementPage> createState() => _MeasurementPageState();
}

class _MeasurementPageState extends State<MeasurementPage> {
  Measurement? data;

  void handleGetMeasurement() async {
    try {
      final response = await getMeasurement();

      setState(() {
        data = response;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao buscar medidas: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.94),
      appBar: AppBar(
        title: const Text("Measurement"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Card(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: data != null
                      ? Column(
                          children: [
                            Text(
                              "Peito: ${data!.chestCircumference.toStringAsFixed(2)} cm",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Cintura: ${data!.waistCircumference.toStringAsFixed(2)} cm",
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Quadril: ${data!.hipCircumference.toStringAsFixed(2)} cm",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      : Column(
                          children: const [
                            Text(
                              "Peito: 0.00 cm",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Cintura: 0.00 cm",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Quadril: 0.00 cm",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: handleGetMeasurement,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Get Measurement",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
