class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode* result = new ListNode;
        ListNode* tmp = result;
        int cin = 0;
        while(l1 != nullptr || l2 != nullptr){
            //用尾插法，不能直接给空指针tmp赋值val
            ListNode *tail = new ListNode;
            int num1, num2;
            if(l1 == nullptr)   num1 = 0;
            else num1 = l1->val;
            if(l2 == nullptr)   num2 = 0;
            else num2 = l2->val;
            tail->val = (num1 + num2 + cin) %10;
            cin = (num1 + num2 + cin) /10;
            tmp->next = tail;
            tmp = tmp->next;
            if(l1)l1 = l1->next;
            if(l2)l2 = l2->next;
        }
        if(cin){
            ListNode *tail = new ListNode;
            tail ->val = cin;
            tmp->next = tail;
            tmp = tmp->next;    
        }
        return result->next;
    }
};