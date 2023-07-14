import 'package:flutter/material.dart';
import 'package:netapp/utilities/constants.dart/app_colors.dart';
import 'package:searchfield/searchfield.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({
    super.key,
    required this.onSuggestedTap,
    required this.validator,
    required this.suggestions,
    this.hint,
  });
  final void Function(SearchFieldListItem<dynamic>) onSuggestedTap;
  final String? Function(String?)? validator;
  final List<SearchFieldListItem<dynamic>> suggestions;
  final String? hint;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SearchField(
        onSubmit: (value) {},
        suggestions: widget.suggestions,
        suggestionState: Suggestion.expand,
        textInputAction: TextInputAction.next,
        hint: widget.hint,
        searchStyle: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        validator: widget.validator,
        searchInputDecoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 2.0,
            ),
          ),
          suffixIcon: const Icon(
            Icons.expand_more,
            color: Color.fromARGB(183, 33, 37, 80),
          ),
          hintStyle: const TextStyle(
            color: AppColors.hintColor,
            fontSize: 15,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.inputBorder, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.inputBorder, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onSuggestionTap: widget.onSuggestedTap,
        maxSuggestionsInViewPort: 6,
        itemHeight: 50,
      ),
    );
  }
}
