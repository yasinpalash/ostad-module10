import 'package:flutter/material.dart';

class UpdateTaskModal extends StatelessWidget {
  const UpdateTaskModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Update Todo',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            maxLines: 4,
            decoration: const InputDecoration(
                hintText: "Enter Ur new Todo",
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.infinity,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Update')))
        ],
      ),
    );
  }
}
