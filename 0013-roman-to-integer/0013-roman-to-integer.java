class Solution {
    public int romanToInt(String s) {
        Map<Character, Integer> roman = new HashMap<>();

        roman.put('I', 1);
        roman.put('V', 5);
        roman.put('X', 10);
        roman.put('L', 50);
        roman.put('C', 100);
        roman.put('D', 500);
        roman.put('M', 1000);

        char before = s.charAt(s.length() - 1);
        int answer = roman.get(before);
        int beforeNum = roman.get(before);

        for (int i = s.length() - 2; i >= 0; i--) {
            char c = s.charAt(i);
            int num = roman.get(c);

            // 나보다 큰 수면 더해준다.
            if (beforeNum <= num) {
                answer += num;
            } else {
                answer -= num;
            }

            before = c;
            beforeNum = num;
        }

        return answer;
    }
}