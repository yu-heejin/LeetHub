class Solution {
    public boolean isPalindrome(int x) {
        String number = String.valueOf(x);

        for (int i = 0; i < number.length(); i++) {
            if (number.charAt(i) != number.charAt(number.length() - 1 - i)) {
                return false;
            }
        }
        return true;
    }
}