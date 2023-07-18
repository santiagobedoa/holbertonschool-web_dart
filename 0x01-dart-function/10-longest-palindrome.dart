String longestPalindrome(String s) {
  if (s.length < 3) {
    return "none";
  }

  String longest = "";

  for (int i = 0; i < s.length; i++) {
    for (int j = i + 1; j <= s.length; j++) {
      String substring = s.substring(i, j);
      if (isPalindrome(substring) && substring.length > longest.length) {
        longest = substring;
      }
    }
  }

  if (longest.isEmpty) {
    return "none\n\n(${s.length} chars long)";
  } else {
    return longest;
  }
}

bool isPalindrome(String s) {
  int start = 0;
  int end = s.length - 1;

  while (start < end) {
    if (s[start] != s[end]) {
      return false;
    }
    start++;
    end--;
  }

  return true;
}

