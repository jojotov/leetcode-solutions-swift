class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

struct Graph {
    var value: String
    var neighbours: [Graph]?
}

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

/*:
 ## 495. Teemo Attacking
 In LOL world, there is a hero called Teemo and his attacking can make his enemy Ashe be in poisoned condition. Now, given the Teemo's attacking ascending time series towards Ashe and the poisoning time duration per Teemo's attacking, you need to output the total time that Ashe is in poisoned condition.
 
 You may assume that Teemo attacks at the very beginning of a specific time point, and makes Ashe be in poisoned condition immediately.
 
 ```
 Example 1:
 Input: [1,4], 2
 Output: 4
 Explanation: At time point 1, Teemo starts attacking Ashe and makes Ashe be poisoned immediately.
 This poisoned status will last 2 seconds until the end of time point 2.
 And at time point 4, Teemo attacks Ashe again, and causes Ashe to be in poisoned status for another 2 seconds.
 So you finally need to output 4.
 ```
 
 ```
 Example 2:
 Input: [1,2], 2
 Output: 3
 Explanation: At time point 1, Teemo starts attacking Ashe and makes Ashe be poisoned.
 This poisoned status will last 2 seconds until the end of time point 2.
 However, at the beginning of time point 2, Teemo attacks Ashe again who is already in poisoned status.
 Since the poisoned status won't add up together, though the second poisoning attack will still work at time point 2, it will stop at the end of time point 3.
 So you finally need to output 3.
 ```
 
 ```
 Note:
 You may assume the length of given time series array won't exceed 10000.
 You may assume the numbers in the Teemo's attacking time series and his poisoning time duration per attacking are non-negative integers, which won't exceed 10,000,000.
 ```
*/


class Solution_495 {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        if timeSeries.count == 0 || duration == 0 {
            return 0
        }
        
        let sortedTimeSeries = timeSeries.sorted {
            $0 < $1
        }
        
        var items: [(start: Int, end: Int)] = []
        for start in sortedTimeSeries {
            items.append((start, duration + start))
        }
        
        var total = 0
        var lastEndTime = 0
        for item in items {
            if item.end > lastEndTime {
                if item.start < lastEndTime {
                    total += item.end - lastEndTime
                } else {
                    total += duration
                }
                lastEndTime = max(item.1, lastEndTime)
            }
        }
        
        return total
    }
}

Solution_495().findPoisonedDuration([1,2], 2)


/*:
 ### 665. Non-decreasing Array

 
 Given an array with `n` integers, your task is to check if it could become non-decreasing by modifying at most `1` element.
 
 We define an array is non-decreasing if `array[i] <= array[i + 1]` holds for every `i` (1 <= i < n).
 
 ```
 Example 1:
 Input: [4,2,3]
 Output: True
 Explanation: You could modify the first 4 to 1 to get a non-decreasing array.
 ```
 
 ```
 Example 2:
 Input: [4,2,1]
 Output: False
 Explanation: You can't get a non-decreasing array by modify at most one element.
 ```
 
 Note: The `n` belongs to [1, 10,000].
 */

class Solution_665 {
    func checkPossibility(_ nums: [Int]) -> Bool {
        if nums.count > 10000 || nums.count == 0 {
            return false
        }
        
        if nums.count == 1 {
            return true
        }
        
        var nums = nums
        var modified = false
        for i in 0...nums.count - 2 {
            if !modified && nums[i] > nums[i+1] {
                let pre = (i != 0) ? nums[i-1] : 0
                if pre <= nums[i+1] {
                    nums[i] = pre
                    modified = true
                } else if nums[i] <= pre{
                    nums[i+1] = pre
                    modified = true
                } else {
                    nums[i+1] = nums[i]
                    modified = true
                }
            }
            
            if nums[i] > nums[i+1] {
                return false
            }
        }
        
        return true
    }
}

Solution_665().checkPossibility([4,2,3,3,3])

/*:
 ### 500. Keyboard Row

 Given a List of words, return the words that can be typed using letters of alphabet on only one row's of American keyboard like the image below.

 Example 1:

 ```
 Input: ["Hello", "Alaska", "Dad", "Peace"]
 Output: ["Alaska", "Dad"]
 ```
 
 Note:
 
 1. You may use one character in the keyboard more than once.
 2. You may assume the input string will only contain letters of alphabet.

 */

class Solution_500 {

    func checkWord(_ word: String) -> Bool {
        var keybord = [
            ["q","w","e","r","t","y","u","i","o","p"],
            ["a","s","d","f","g","h","j","k","l"],
            ["z","x","c","v","b","n","m",]
        ]
        
        var start = word.startIndex
        var index = 0
        for i in 0..<keybord.count {
            if keybord[i].contains(String(word[start])) {
                index = i
                break;
            }
        }
        
        print(index)
        
        while start != word.endIndex {
            if !keybord[index].contains(String(word[start])) {
                return false
            }
            start = word.index(start, offsetBy: 1)
        }
        return true
    }
    
    func findWords(_ words: [String]) -> [String] {
        var checkedWords: [String] = []
        for word in words {
            if checkWord(word.lowercased()) {
                checkedWords.append(word)
            }
        }
        
        return checkedWords
    }
}

Solution_500().findWords(["Hello","Alaska","Dad","Peace"])


/*: 25. Reverse Nodes in k-Group

 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 You may not alter the values in the nodes, only nodes itself may be changed.
 
 Only constant memory is allowed.
 
 For example,
 Given this linked list: `1->2->3->4->5`
 
 For k = 2, you should return: `2->1->4->3->5`
 
 For k = 3, you should return: `3->2->1->4->5`
 */


class Solution_25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        
    }
}
 
 
