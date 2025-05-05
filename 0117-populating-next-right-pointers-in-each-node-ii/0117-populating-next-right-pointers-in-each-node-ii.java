/*
// Definition for a Node.
class Node {
    public int val;
    public Node left;
    public Node right;
    public Node next;

    public Node() {}
    
    public Node(int _val) {
        val = _val;
    }

    public Node(int _val, Node _left, Node _right, Node _next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
};
*/

class Solution {
    public Node connect(Node root) {
        if (root == null) return root;

        Queue<Node> q = new LinkedList<>();

        // root
        q.add(root);

        while (!q.isEmpty()) {
            int qSize = q.size();
            Node prev = null;   // 레벨이 바뀔 때마다 null로 갱신된다.

            for (int i = 0; i < qSize; i++) {
                Node node = q.poll();
                
                if (prev != null) {
                    // 만약 이전 노드가 null이 아니라면 오른쪽 노드 연결
                    prev.next = node;
                }

                // 다음 노드로 이동
                // 처음에 prev는 root를 가리키기 때문에, prev가 움직이더라도 root의 값이 갱신된다.
                prev = node;

                if (node.left != null) {
                    q.add(node.left);
                }

                if (node.right != null) {
                    q.add(node.right);
                }
            }
        }

        return root;
    }
}