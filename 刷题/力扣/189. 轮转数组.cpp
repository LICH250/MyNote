class Solution {
public:
    void reverse(vector<int>& nums, int left, int right){
        while(left < right){
            swap(nums[left], nums[right]);
            ++left;
            --right;
        }
    }
    void rotate(vector<int>& nums, int k) {
        int len = k % nums.size();
        reverse(nums, 0, nums.size()-1);
        reverse(nums, 0, len-1);
        reverse(nums, len, nums.size()-1);
        return;
    }
};