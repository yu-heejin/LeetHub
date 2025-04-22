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
    public ListNode rotateRight(ListNode head, int k) {
        if (k == 0 || head == null || head.next == null) {
            // 회전하지 않거나, 리스트가 없거나, 리스트 요소가 하나인 경우
            return head;
        }

        // 리스트의 사이즈 구하기
        int size = 1;
        ListNode tail = head;
        while (tail.next != null) {
            tail = tail.next;
            size++;
        }

        System.out.println("tail: " + tail.val);

        // head의 위치
        /**
            1. 먼저 k % size 하는 이유:
            회전 수 k가 너무 크면 전체 길이만큼 돌고 다시 원래대로 돌아옴

            따라서 k %= size로 줄여야 실제 회전량이 됩니다.

            2. 그리고 size - k는 무엇인가?
            오른쪽으로 k칸 이동하는 건,

            왼쪽으로 size - k칸 이동하는 것과 같은 효과입니다!
         */

        // 리스트를 size만큼 회전하면 원래대로 돌아온다.
        // [1, 2, 3, 4, 5]이고 size = 5, k = 5 -> head값이 1임
        if (k % size == 0) return head;

        int headIndex = size - (k % size);
        System.out.println(headIndex);
        // head 위치만큼 이동
        ListNode node = head;
        ListNode prev = head;
        for (int i = 0; i < headIndex; i++) {
            if (i == headIndex - 1) {
                prev = node;
            }
            node = node.next;
        }

        tail.next = head;
        head = node;
        prev.next = null;

        return head;
    }
}