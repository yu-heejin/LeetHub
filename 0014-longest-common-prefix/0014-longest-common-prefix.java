class Solution {
    public String longestCommonPrefix(String[] strs) {
        Arrays.sort(strs);  // prefix를 찾기 위한 정렬

        String prefix = strs[0];   // prefix를 첫번째 문자열로 잡는다.
        boolean isCommon = false;

        for (int i = 1; i < strs.length; i++) {
            StringBuilder sb = new StringBuilder();
            int j = 0;

            while (j < prefix.length() && j < strs[i].length() && strs[i].charAt(j) == prefix.charAt(j)) {
                sb.append(strs[i].charAt(j));
                j++;
            }

            if (!sb.toString().equals("")) {
                prefix = sb.toString();
                isCommon = true;
            } else {
                isCommon = false;
                prefix = "";
                break;
            }
        }

        return prefix;
    }
}