class IntBinaryTree {
  int i;
  IntBinaryTree left;
  IntBinaryTree right;

  IntBinaryTree(int _i, IntBinaryTree _left, IntBinaryTree _right) {
    i = _i;
    left = _left;
    right = _right;
  }

  int sumAll() {
    int answer = this.i;
    if (left != null) {
      answer += left.sumAll();
    }
    if (right != null) {
      answer += right.sumAll();
    }
    return answer;
  }
}
