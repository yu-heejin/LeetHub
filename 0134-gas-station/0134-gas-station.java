class Solution {
    public int canCompleteCircuit(int[] gas, int[] cost) {
        int gasTank = 0;
        int start = 0;
        int totalGas = 0;
        int totalCost = 0;

        for (int i = 0; i < gas.length; i++) {
            gasTank += (gas[i] - cost[i]);
            totalGas += gas[i];
            totalCost += cost[i];

            if (gasTank < 0) {
                // 합이 음수인 경우, 더이상 출발할 수 없으므로 출발지를  다음으로 이동한다.
                start = i + 1;
                gasTank = 0;
            }
        }

        return totalGas - totalCost >= 0 ? start : -1;
    }
}