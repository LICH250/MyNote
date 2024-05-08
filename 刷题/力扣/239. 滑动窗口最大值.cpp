//照着答案写的
class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        deque<int> q;
        for(int i = 0; i < k; ++i){
            while(!q.empty() && nums[i] >= nums[q.back()]){
                q.pop_back();
            }
            q.push_back(i);
        }
        vector<int> result;
        result.push_back(nums[q.front()]);
        for(int i = k; i < nums.size(); ++i){
            while(!q.empty() && nums[i] >= nums[q.back()]){
                q.pop_back();
            }
            q.push_back(i);
            while(q.front() <= i - k){
                q.pop_front();
            }
            result.push_back(nums[q.front()]);
        }
        return result;
    }
};