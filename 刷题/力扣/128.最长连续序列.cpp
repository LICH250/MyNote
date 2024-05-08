class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        unordered_set<int> myset;
        for(int i = 0; i < nums.size(); i++){
            myset.insert(nums[i]);
        }
        // map<int, int> mp;
        int len = 0;
        for(const int& num : myset){
            if(myset.find(num + 1) == myset.end()){
                int find_head = num;
                int current = 1;
                while(myset.find(find_head - 1) != myset.end()){
                    find_head -=1;
                    current +=1;
                }
                len = max(len, current);
            }
        }
        return len;
    }
};