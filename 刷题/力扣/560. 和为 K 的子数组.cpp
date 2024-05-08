class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        unordered_map<int, int> preSum;
        preSum[0] = 1;
        int tempSum = 0;
        int result = 0;
        for(int i = 0; i < nums.size(); ++i){
            tempSum += nums[i];
            if(preSum.find(tempSum - k) != preSum.end())
                result += preSum[tempSum - k];
            ++preSum[tempSum];
        }

        return result;
    }
};