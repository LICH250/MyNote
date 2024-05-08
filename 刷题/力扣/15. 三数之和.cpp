class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        vector<vector<int>> result;
        sort(nums.begin(), nums.end());
        for(int i = 0; i < nums.size(); i++){
            int target = 0 - nums[i];
            int left = i + 1, right = nums.size() - 1;
            if(i >0 && nums[i] == nums[i-1]) continue;
            while(left < right){
                if(nums[left] + nums[right] == target){
                    result.push_back({nums[i], nums[left], nums[right]});
                    while(left < right && nums[left+1] == nums[left])left++;
                    left++;
                    while(left < right && nums[right-1] == nums[right])right--;
                    right--;
                }
                else if(nums[left] + nums[right] < target)
                    left++;
                else
                    right--;
            }
        }
        return result;
    }
};