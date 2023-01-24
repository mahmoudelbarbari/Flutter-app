import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order/features/login/presentation/pages/login_page.dart';
import 'package:order/features/register/domain/entities/register_entities.dart';
import 'package:order/features/register/presentation/cubit/register_cubit.dart';
import 'package:order/features/register/presentation/pages/register_page.dart';

class RegisterWidget extends StatefulWidget {
  RegisterAccountEntity registerAccountEntity;
  RegisterWidget({super.key, required this.registerAccountEntity});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late TextEditingController _controller_username;
  late TextEditingController _controller_password;
  late TextEditingController _controller_name;
  late TextEditingController _controller_email;
  late TextEditingController _controller_gender;
  late TextEditingController _controller_phone;
  late GlobalKey<FormState> _keyform;
  late GlobalKey<FormState> _keyform1;

  @override
  void initState() {
    super.initState();
    _controller_username = TextEditingController();
    _controller_password = TextEditingController();
    _controller_name = TextEditingController();
    _controller_email = TextEditingController();
    _controller_gender = TextEditingController();
    _controller_phone = TextEditingController();
    _keyform = GlobalKey<FormState>();
    _keyform1 = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _controller_username.dispose();
    _controller_password.dispose();
    _controller_name.dispose();
    _controller_email.dispose();
    _controller_gender.dispose();
    _controller_phone.dispose();
    super.dispose();
  }

  String? selectedValue;
  List<String> items = [
    'Female',
    'Male',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyform,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'please fill the form';
                    }
                  },
                  controller: _controller_username,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _controller_name,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: true,
                  controller: _controller_password,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password.';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9.]+')
                        .hasMatch(value)) {
                      return "Please enter a valid Password";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _controller_password.text = value;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(13.0),
                child: TextFormField(
                  controller: _controller_email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mail address.';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9.]+')
                        .hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _controller_email.text = value;
                    });
                  },
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButtonFormField<String?>(
                  hint: const Text(
                    'gender',
                    style: TextStyle(fontSize: 20),
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  value: selectedValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _controller_gender.text = value!;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _controller_phone,
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.smartphone_sharp),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(327, 56),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ));
                    setState(() {
                      if (_keyform.currentState!.validate()) {
                        context.read<RegisterCubit>().registerAccountFromRemote(
                            registerAccountEntity: RegisterAccountEntity(
                              gender: _controller_gender.text.trim(),
                              name: _controller_name.text,
                              phoneNumber: _controller_phone.text,
                              username: _controller_username.text,
                            ),
                            email: _controller_email.text.trim(),
                            password: _controller_password.text);
                      }
                    });
                  },
                  child: const Text('Sign up'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                    },
                    child: const Text('Login Now'),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
