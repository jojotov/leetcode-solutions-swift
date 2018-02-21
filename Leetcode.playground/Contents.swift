
/*:
 ## 367. Valid Perfect Square
 ### Given a positive integer num, write a function which returns True if num is a perfect square else False.
 
 ```
 Input: 16
 Returns: True
 ```
 
 ```
 Input: 14
 Returns: False
 ```
 */

func isPerfectSquare(_ num: Int) -> Bool {
    if num == 0 {return true}
    for i in 1...num {
        if i * i > num {return false}
        else if i * i == num {return true}
    }
    
    return false
}

isPerfectSquare(16)
isPerfectSquare(14)
isPerfectSquare(2147483647)

/*:
 ## 687. Longest Univalue Path
 ### Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.


 ```
 Input:
 
     5
    / \
   4   5
  / \   \
 1   1   5

 Output: 2
 ```
 
 ```
 Intput:
 
     1
    / \
   4   5
  / \   \
 4   4   5
 
 Output: 2
 ```
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    static var testRoot: TreeNode {
        let leaf4 = TreeNode(4)
        let leaf5 = TreeNode(5)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let root = TreeNode(1)
        node4.left = leaf4
        node4.right = leaf4
        node5.right = leaf5
        root.left = node4
        root.right = node5
        return root
    }
}

func longestUnivaluePath(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }

    return length(root, val: root.val).maxLen
}

func length(_ node: TreeNode?, val: Int) -> (len: Int, maxLen: Int) {
    guard let node = node else {
        return (0,0)
    }
    let left = length(node.left, val: node.val)
    let right = length(node.right, val: node.val)
    let maxLen = max(max(right.maxLen, left.len + right.len), max(left.maxLen, left.len + right.len))
    if node.val == val {
        return (max(left.len, right.len) + 1, maxLen)
    }
    return (0, maxLen)
}

longestUnivaluePath(TreeNode.testRoot)


/*:
 ## 127. Word Ladder
 ###  Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:
 
 Only one letter can be changed at a time.
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 
 For example,
 
 Given:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log","cog"]
 
 As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 */

struct Graph {
    var value: String
    var neighbours: [Graph]?
}

extension Graph {
    func bfs(_ end: Graph) -> Int {
        var count = 1
        var queue: [Graph] = [self]
        var visited: [Graph] = [self]
        
        while queue.count > 0 {
            //dequeue current visiting
            let current = queue.removeFirst()
            if current.value == end.value {
                break
            }
            //traval neighbours
            if let neighbours = current.neighbours {
                count += 1
                for neighbour in neighbours {
                    if !visited.contains { $0.value == neighbour.value } {
                        queue.append(neighbour)
                        visited.append(neighbour)
                    }
                }
            }
        }
        
        return count
    }
}

class Solution_127 {
    func isNeighbour(with s1: String, and s2: String) -> Bool {
        var isNeighbour = false
        for i in 0..<s2.count {
            let index = s2.index(s2.startIndex, offsetBy: i)
            if s1[index] != s2[index] {
                if isNeighbour {
                    return false
                }
                isNeighbour = true
            }
        }
        return isNeighbour
    }
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // Create Grapth
        var map: [String : Graph] = [
            beginWord : Graph(value: beginWord, neighbours: []),
            endWord : Graph(value: endWord, neighbours: [])
        ]
        
        for word in wordList {
            map[word] = Graph(value: word, neighbours: [])
        }
        
        for (key, graph) in map {
            var graph = graph
            for i in 0..<wordList.count {
                let word = wordList[i]
                if let wordGraph = map[word] {
                    if isNeighbour(with: key, and: word) {
                        graph.neighbours?.append(wordGraph)
                    }
                }
            }
            map[key] = graph
        }
        
        
        // BFS
        return map[beginWord]!.bfs(map[endWord]!)
    }
}


Solution_127().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])

/*:
 ## 452. Minimum Number of Arrows to Burst Balloons
 
 There are a number of spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter and hence the x-coordinates of start and end of the diameter suffice. Start is always smaller than end. There will be at most 104 balloons.
 
 An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps travelling up infinitely. The problem is to find the minimum number of arrows that must be shot to burst all balloons.
 
 Example:
 
 > Input:
 > [[10,16], [2,8], [1,6], [7,12]]
 >
 > Output:
 > 2
 >
 > Explanation:
 > One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at x = 11 (bursting the other two balloons).
 */

class Solution_452 {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 0 else {
            return 0
        }
        
        //sorted with each baloons' min x
        var sortedPoints = points.sorted {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            }
            return $0[0] < $1[0]
        }
        //calculate
        var arrow = 1
        var arrowLimit = sortedPoints[0][1]
        for balloon in sortedPoints {
            if balloon[0] <= arrowLimit {
                arrowLimit = min(balloon[1], arrowLimit)
            } else {
                arrow += 1
                arrowLimit = balloon[1]
            }
        }
        
        return arrow
    }
}

Solution_452().findMinArrowShots([[10,16], [2,8], [1,6], [7,12]])
Solution_452().findMinArrowShots([[9,12],[1,10],[4,11],[8,12],[3,9],[6,9],[6,7]])


