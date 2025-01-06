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
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode list = new ListNode(0);
        ListNode answer = list;   // 최초 LinkedList의 주소값을 가진다.

        int carry = 0;

        while (l1 != null || l2 != null) {
            int sum = carry;

            if (l1 != null) {
                sum += l1.val;
                l1 = l1.next;
            }

            if (l2 != null) {
                sum += l2.val;
                l2 = l2.next;
            }

            // 두 수를 더한 값이 10 이상인 경우, 몫은 캐리, 나머지는 자리수
            carry = sum / 10;
            list.next = new ListNode(sum % 10);
            list = list.next;
        }

        // 마지막으로 더한 값이 캐리가 발생한 경우
        if (carry > 0) {
            list.next = new ListNode(carry);
        }

        return answer.next;   // 그 다음 List를 반환하면 원하던 리스트 반환 가능
    }
}