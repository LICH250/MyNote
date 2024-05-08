/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        int lenA = 0, lenB = 0;
        if(headA == headB) return headA;
        ListNode *temp = headA;
        while(temp != nullptr){
            temp = temp -> next;
            lenA++;
        }
        temp = headB;
        while(temp != nullptr){
            temp = temp -> next;
            lenB++;
        }
        if(lenA < lenB){
            for(int i = 0; i < lenB - lenA; ++i)
                headB = headB->next;
        }
        else if(lenA > lenB){
            for(int i = 0; i < lenA - lenB; ++i)
                headA = headA->next;
        }
        while(headA != nullptr || headB != nullptr){
            if(headA == headB)  return headA;
            headA = headA->next;
            headB = headB->next;
        }
        return nullptr;
    }
};


//力扣答案
class Solution {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        if (headA == nullptr || headB == nullptr) {
            return nullptr;
        }
        ListNode *pA = headA, *pB = headB;
        while (pA != pB) {
            pA = pA == nullptr ? headB : pA->next;
            pB = pB == nullptr ? headA : pB->next;
        }
        return pA;
    }
};

作者：力扣官方题解
链接：https://leetcode.cn/problems/intersection-of-two-linked-lists/solutions/811625/xiang-jiao-lian-biao-by-leetcode-solutio-a8jn/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。