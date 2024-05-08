class Solution {
public:
    bool isPalindrome(ListNode* head) {
        ListNode* head2 = nullptr;
        ListNode* cur = head;
        while(cur != nullptr){
            ListNode* tmp = new ListNode;
            tmp->val = cur->val;
            tmp->next = head2;
            head2 = tmp;
            cur = cur->next;
        }
        while(head != nullptr){
            if(head->val != head2->val)
                return false;
            head = head->next;
            head2 = head2->next;
        }
        return true;
    }
};