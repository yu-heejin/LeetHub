import java.util.*;

class Solution {
    public int lengthOfLongestSubstring(String s) {
        int length = 0;

        for (int i = 0; i < s.length(); i++) {
            StringBuffer substring = new StringBuffer();

            for (int j = i; j < s.length(); j++) {
                char c = s.charAt(j);
                if (substring.toString().indexOf(c) == -1) {
                    substring.append(c);
                } else {
                    break;
                }
            }

            length = Math.max(length, substring.toString().length());
        }

        return length;
    }
}