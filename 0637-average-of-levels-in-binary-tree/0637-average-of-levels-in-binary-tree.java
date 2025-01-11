/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
import java.util.*;

class Solution {
    public List<Double> averageOfLevels(TreeNode root) {
        Queue<TreeNode> levelQueue = new LinkedList<>();
        List<Double> avgs = new ArrayList<>();

        levelQueue.add(root);

        // level order
        while (!levelQueue.isEmpty()) {
            int queueSize = levelQueue.size();
            double avg = 0;

            for (int i = 0; i < queueSize; i++) {
                TreeNode node = levelQueue.poll();
                avg += node.val;

                if (node.left != null) {
                    levelQueue.add(node.left);
                }

                if (node.right != null) {
                    levelQueue.add(node.right);
                }
            }

            avg = avg / queueSize;
            avgs.add(avg);
        }

        return avgs;
    }
}