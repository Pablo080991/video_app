import "package:flutter/material.dart";

class SearchFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const SearchFieldBox({
    super.key, required this.onValue
    }
    );

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide:  const BorderSide(color:Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder,
        filled: true,
        hintText: "Enter video search",
        suffixIcon:  IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
          },
          ),
      ),
      onFieldSubmitted: (value) {
            textController.clear();
      },
    );
  }
}