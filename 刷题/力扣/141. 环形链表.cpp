class Solution {
public:
    bool hasCycle(ListNode *head) {
        unordered_set<ListNode*> mp;
        while(head != nullptr){
            if(mp.count(head)) return true;
            mp.insert(head);
            head = head->next;
        }
        return false;
    }
};