import 'package:flutter/material.dart';
import '../../class/cubit/models/Medicine_model_pharmacist.dart';


class MedicineDetails extends StatelessWidget {
  final MedicineModel medicine;

  const MedicineDetails({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          medicine.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor:
        medicine.availability == 'Available' ? Colors.green : Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              child: Image.network(
                medicine.photo,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_outlined, size: 200);
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              medicine.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manufacturer: ${medicine.manufacturer}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Price: ${medicine.price} EGP',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Expiry Date: ${medicine.expiry_date}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Availability: ${medicine.availability}',
                      style: TextStyle(
                        fontSize: 16,
                        color: medicine.availability == 'Available'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description:',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      medicine.description,
                      style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Side Effects:',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ...medicine.side_effects.map((sideEffect) => Text(
                      '- $sideEffect',
                      style:
                      TextStyle(fontSize: 16, color: Colors.grey[800]),
                    )),
                    const SizedBox(height: 16),
                    Text(
                      'Quantity: ${medicine.quantity}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
