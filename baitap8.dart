void main() {
  String sentence = "Dart is fun and Dart is easy";

  Map<String, int> result = countWordFrequencies(sentence);
  
  print('Câu gốc: "$sentence"');
  print('Kết quả đếm: $result');
}

Map<String, int> countWordFrequencies(String sentence) {
  Map<String, int> wordCount = {};
  String lowerCaseSentence = sentence.toLowerCase();
  List<String> words = lowerCaseSentence.split(' ');

  for (String word in words) {
    if (word.trim().isEmpty) continue;
    if (wordCount.containsKey(word)) {
      wordCount[word] = wordCount[word]! + 1;
    } 
    else {
      wordCount[word] = 1;
    }
  }

  return wordCount;
  }