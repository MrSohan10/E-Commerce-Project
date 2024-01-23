import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _writeReviewTEController = TextEditingController();
  final GlobalKey <FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 36,right: 36,top: 60),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter First Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter Last Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  decoration:
                  const InputDecoration(hintText: 'Write Review',),
                  validator: (value) {
                    if (value!.trim().isEmpty ?? true) {
                      return 'Enter Shipping Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formkey.currentState!.validate()){

                      }
                    },
                    child: const Text('Submit'),
                  ),
                )
              ],
            ),
          ),

        ),
      ),
    );
  }
}
