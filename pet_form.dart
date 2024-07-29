import 'package:flutter/material.dart';

class PetForm extends StatefulWidget {
  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController colorMarkingsController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController contactNoController = TextEditingController();
  final TextEditingController appointmentDateController = TextEditingController();
  DateTime? selectedDate;
  DateTime? selectedAppointmentDate;
  TimeOfDay? selectedTime;
  final List<String> availableTimes = [
    '09:00 AM - 10:00 AM',
    '10:00 AM - 11:00 AM',
    '11:00 AM - 12:00 PM',
    '01:00 PM - 02:00 PM',
    '02:00 PM - 03:00 PM',
    '03:00 PM - 04:00 PM',
  ];
  String? selectedAvailableTime;

  Future<void> _selectDate(BuildContext context, TextEditingController controller, {DateTime? initialDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        if (controller == birthdateController) {
          selectedDate = picked;
        } else if (controller == appointmentDateController) {
          selectedAppointmentDate = picked;
        }
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        String formattedTime = picked.format(context);
        selectedAvailableTime = availableTimes.firstWhere((time) => time.startsWith(formattedTime));
      });
  }

  void _submitForm() {
    if (ownerNameController.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        '/dashboard',
        arguments: ownerNameController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 246, 249),
      appBar: AppBar(
        title: Text('Pet Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/616/616408.png',
                          width: 50,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Pawssible',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF6A1B9A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: petNameController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Pet Name'),
                    ),
                    TextField(
                      controller: breedController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Breed'),
                    ),
                    TextField(
                      controller: speciesController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Species'),
                    ),
                    TextField(
                      controller: sexController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Sex'),
                    ),
                    TextField(
                      controller: birthdateController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey), 
                        labelText: 'Birthdate',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context, birthdateController, initialDate: selectedDate),
                        ),
                      ),
                    ),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Age'),
                    ),
                    TextField(
                      controller: colorMarkingsController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Color Markings'),
                    ),
                    TextField(
                      controller: ownerNameController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Owner Name'),
                    ),
                    TextField(
                      controller: contactNoController,
                      decoration: InputDecoration(labelStyle: TextStyle(color: Colors.grey), labelText: 'Contact Number'),
                    ),
                    TextField(
                      controller: appointmentDateController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey), 
                        labelText: 'Appointment Date',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context, appointmentDateController, initialDate: selectedAppointmentDate),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      value: selectedAvailableTime,
                      decoration: InputDecoration(
                        labelText: 'Available Time',
                        labelStyle: TextStyle(color: Colors.grey), 
                      ),
                      items: availableTimes.map((String time) {
                        return DropdownMenuItem<String>(
                          value: time,
                          child: Text(time),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedAvailableTime = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
