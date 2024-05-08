class Solution {
public:
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
        ListNode* result = new ListNode;
        ListNode* tmp = result;
        while(list1 != nullptr && list2 != nullptr){
            if(list1->val > list2->val){
                tmp->next = list2;
                list2 = list2->next;
                tmp = tmp->next;
            }
            else{
                tmp->next = list1;
                list1 = list1->next;
                tmp = tmp->next;
            }
            }
        if(list1 == nullptr)    tmp->next = list2;
        else if(list2 == nullptr)    tmp->next = list1;
        return result->next;
    }
};