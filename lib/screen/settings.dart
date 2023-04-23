import 'package:flutter/material.dart';
import 'package:show_weather_currency/main.dart';

class Settings extends StatefulWidget {
  static String id = "Settings";
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
 final _formkey = GlobalKey<FormState>();

  static final List<String> countries = <String>[
    "United States - New York",
    "United Kingdom - London",
    "UAE - Dubai",
    "India - Mumbai",
    "Japan - Tokyo",
    "Russia - Moscow",
    "Canada - Toronto",
  ];
  String selected_country = countries.first;
  static TextEditingController countryEditingController =
      TextEditingController();
  Map<String, bool> options = {
    "Currency": true,
    "Weather": true,
  };
  // TODO: implement initState

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(onWillPop: (){
        Navigator.pushNamedAndRemoveUntil(context, home.id, (Route<dynamic>route) => false);
        return Future(() => false);
      },
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.blue.shade300,
            leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, home.id, (Route<dynamic>route) => false);
            },),
            title: Center(
              child: Text(
                "Settings",
                style: TextStyle(
                    color: Colors.yellow.shade200,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
          ),
          backgroundColor: Colors.blue.shade300,
          body: Form(
            key: _formkey,
            child: ListView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country :",
                        style: TextStyle(
                            letterSpacing: 2,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.yellow.shade200),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue.shade100),
                              child: TextFormField(
                                key: const ValueKey("Country"),
                                controller: countryEditingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter or Select ",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a country/city name";
                                  }
                                  else{
                                    return null;
                                  }
                                },

                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue.shade100),
                            child: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_downward),
                              onSelected: (value){

                                setState(() {
                                  countryEditingController.text=value;
                                });
                              },
                              itemBuilder: (context){
                                return countries.map(
                                        (String value) {
                                      return PopupMenuItem(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList();
                              }
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Display Option :",
                        style: TextStyle(
                            letterSpacing: 2,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.yellow.shade200),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 100,
                        child: FormField(
                            key: const ValueKey("Options"),
                          validator: (value){
                            if(value==false){
                              return "Please select at least one";
                            }
                            else{
                              return null;
                            }
                          },
                            builder: (FormFieldState<bool> state) {
                          return ListView(
                            children: options.keys.map((String key) {
                              return CheckboxListTile(
                                title: Text(key,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                value: options[key],
                                onChanged: (bool? value) {
                                  setState(() {
                                    options[key] = value!;
                                    state.didChange(value);

                                  });
                                },
                              );
                            }).toList(),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow.shade200)),
                            onPressed: (){
                          if(_formkey.currentState!.validate()){
                            _formkey.currentState!.save();
                            print("submited");
                          }
                          else{
                            print("yoo");
                          }
                        }, child: Text("Save",style: TextStyle(color: Colors.black,fontSize: 30),)),
                      ),
                    ],
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
