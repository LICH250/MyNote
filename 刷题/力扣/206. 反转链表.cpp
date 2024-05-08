class Solution {
public:
    ListNode* reverseList(ListNode* head) {
        ListNode* pre = nullptr;
        ListNode* temp = nullptr;
        while(head != nullptr){
            temp = head->next;
            head->next = pre;
            pre = head;
            head = temp;
        }
        return pre;
    }
};