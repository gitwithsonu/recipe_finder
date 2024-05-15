import 'package:flutter/material.dart';

class SearchBar2 extends StatefulWidget {
  final double width;
  final double height;
  final Function(String) onSubmitted;

  const SearchBar2({super.key, required this.onSubmitted, required this.width, required this.height});

  @override
  _SearchBar2State createState() => _SearchBar2State();
}

class _SearchBar2State extends State<SearchBar2> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.grey,
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search ingredients (e.g., chicken, tomato, onion)',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(_isTyping ? Icons.clear : Icons.search),
              onPressed: () {
                if (_isTyping) {
                  _controller.clear();
                  FocusScope.of(context).unfocus(); // Hide keyboard
                  setState(() {
                    _isTyping = false;
                  });
                  widget.onSubmitted(_controller.text);
                } else {
                  widget.onSubmitted(_controller.text);
                }
              },
            ),
          ),
          onChanged: (value) {
            setState(() {
              _isTyping = value.isNotEmpty;
            });
          },
          onSubmitted: (value) {
            widget.onSubmitted(value);
            FocusScope.of(context).unfocus(); // Hide keyboard after submission
          },
          textInputAction: TextInputAction.search, // This changes the keyboard action button to a search icon
        ),
      ),
    );
  }
}