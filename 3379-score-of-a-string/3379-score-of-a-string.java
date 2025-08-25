class Solution {
    public int scoreOfString(String s) {
        int answer = 0;

        for (int i = 0; i < s.length() - 1; i++) {
            int c1 = s.charAt(i);
            int c2 = s.charAt(i + 1);

            answer += Math.abs(c1 - c2);
        }

        return answer;
    }
}