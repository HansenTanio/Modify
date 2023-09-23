import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int? _radioValue = 0;
  bool visibilityPass = false;
  TextEditingController _dateController = TextEditingController();
  DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

  String? _username;
  String? _password;
  String? _phone;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  void _setDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      String formattedDate = _dateFormat.format(selectedDate);
      _dateController.text = formattedDate;
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _handleUsernameChange(String value) {
    setState(() {
      _username = value;
    });
  }

  void _handlePasswordChange(String value) {
    setState(() {
      _password = value;
    });
  }

  void _handlePhoneChange(String value) {
    setState(() {
      _phone = value;
    });
  }

  void _showPasswordErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Password Invalid'),
          content: Text('Password harus memiliki minimal 10 karakter.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPhoneErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Nomor Telepon Invalid'),
          content: Text(
              'Nomor telepon harus hanya berisi angka dan maksimal 15 angka.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showEmptyFieldErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Kolom Kosong'),
          content: Text('Masih ada kolom yang kosong ya, tolong diisi semua.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.account_circle,
                  size: 50,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              onChanged: _handleUsernameChange,
              decoration: InputDecoration(
                labelText: "Username",
                icon: Icon(
                  Icons.people,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              readOnly: true,
              controller: _dateController,
              onTap: _setDatePicker,
              decoration: InputDecoration(
                labelText: "Date of birth",
                icon: Icon(
                  Icons.date_range,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                icon: Icon(
                  Icons.email,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: !visibilityPass,
              onChanged: _handlePasswordChange,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visibilityPass = !visibilityPass;
                    });
                  },
                  icon: visibilityPass
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),
                icon: Icon(
                  Icons.settings,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.phone,
              onChanged: _handlePhoneChange,
              decoration: InputDecoration(
                labelText: "Phone",
                icon: Icon(
                  Icons.phone,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  children: [
                    Radio<int>(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Male',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2!.color,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Female',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2!.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_username == null ||
                        _username!.isEmpty ||
                        _dateController.text.isEmpty) {
                      _showEmptyFieldErrorDialog();
                    } else if (_password != null && _password!.length >= 10) {
                      if (_phone != null &&
                          _phone!.length <= 15 &&
                          RegExp(r'^[0-9]+$').hasMatch(_phone!)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }),
                        );
                      } else {
                        _showPhoneErrorDialog();
                      }
                    } else {
                      _showPasswordErrorDialog();
                    }
                  },
                  child: Text('REGISTER'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
