import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'component/component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner:false,
    );
  }
}


List <Items> data = [
  Items('one',false),
  Items('two',false),
  Items('three',false),
  Items('four',false),
  Items('five',false),
  Items('six',false),
  Items('seven',false),
  Items('eight',false),
  Items('nine',false),
  Items('ten',false),
  Items('eleven',false),
  Items('twelve',false),
  Items('thirteen',false),
  Items('fourteen',false),
  Items('fifteen',false),
  Items('sixteen',false),
  Items('seventeen',false),
  Items('eighteen',false),
  Items('nineteen',false),
  Items('twelve',false),


];

late int counter=0;
class Items {
  String title;
   bool isSelected=true;

  Items(this.title,this.isSelected);
  @override toString() =>  '$title';



}
late List data2= [];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('WELCOME',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),),
              SizedBox(height: 20,),
              Padding(
                padding:EdgeInsets.all(20),
                child:
                DefaultFormField(
                  controller: emailcontroller,
                  type: TextInputType.emailAddress,
                  label: 'Email Address',
                  prefix: Icons.email,
                  function: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }//if(value)
                    if(!value.toString().contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                      return 'check your email';
                    }
                    return null;
                  }
                ),
              ),
              Padding(
                padding:EdgeInsets.all(20),
                child:
                DefaultFormField(
                    label: 'Password',
                    prefix: Icons.lock,
                    suffix: isPassword ? Icons.visibility_off : Icons.remove_red_eye ,
                    suffixpressed: (){
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    isPassword: isPassword,
                    function: (value){
                     if (value == null || value.isEmpty) {
                       return 'Please enter some text';
                    }
                     if(value.length<6){
                       return 'must be more than 6 character';
                    } //if(value)
                      return null;
                  },
                    controller: passwordcontroller
                )
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MysecondPage()),
                    );
                  }
                  print(emailcontroller.text);
                  print(passwordcontroller.text);
                },
                child: const Text('ENTER'),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
class MysecondPage extends StatefulWidget {
  MysecondPage({Key? key}) : super(key: key);
  @override
  SecondScreen createState() => SecondScreen();
}

class SecondScreen extends State<MysecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text('Catalog'),
        backgroundColor: Colors.yellow,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdScreen()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
          itemBuilder: (BuildContext context,int index){
            return ListTile(
                leading: Icon(Icons.list,color:Colors.blue,),
                trailing: (data[index].isSelected)? Icon(Icons.check,color: Colors.blue,) :
                TextButton(
                   onPressed: (){
                     setState(() {
                       data[index].isSelected=true;
                         data2.add(data[index]);
                     });
                   },
                   child: Text('ADD'),
                ),
                title:Text('${data[index].title}')
            );
          }
      ),

    );
  }
}


class ThirdScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
            backgroundColor: Colors.yellow,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(' ${data2.join(" \n ")}',
        style: TextStyle(fontSize: 30,),
        )
      ],),
    );
  }
}
