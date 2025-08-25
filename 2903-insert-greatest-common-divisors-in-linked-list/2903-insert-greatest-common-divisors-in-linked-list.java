/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode insertGreatestCommonDivisors(ListNode head) {
        ListNode newListNodes = head;
        while (head.next != null) {
            ListNode first = head;
            ListNode second = head.next;
            head = head.next;

            int result = getGreatestCommonDivisor(first.val, second.val);

            ListNode newNode = new ListNode(result);

            // 두 리스트 사이에 끼워넣어야 한다.
            first.next = newNode;
            newNode.next = second;
        }

        return newListNodes;
    }

    private int getGreatestCommonDivisor(int a, int b) {
        // 유클리드 호제법
        while (b != 0) {
            int r = a % b;
            a = b;
            b = r;
        }

        return a;
    }
}