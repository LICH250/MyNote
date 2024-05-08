class Solution {
public:
    ListNode* removeNthFromEnd(ListNode* head, int n) {
        ListNode* del = head;
        ListNode* last = head;
        ListNode* pre = head;
        while(n != 1){
            last = last->next;
            --n;
        }
        if(last->next){
            del = del->next;
            last=last->next;
        }
        else return head->next;
        while(last->next){
            pre = pre->next;
            del = del->next;
            last=last->next;
        }
        pre->next=del->next;
        return head;
    }
};