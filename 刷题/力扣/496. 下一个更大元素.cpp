class Solution {
public:
    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        stack<int> res;
        res.push(-1);
        map<int, int> find_res;
        vector<int> result;
        for(int j = nums2.size()-1; j >=0; --j){
            while(!res.empty() && nums2[j] > res.top()){
                res.pop();
            }
            if(res.empty()) find_res.insert(make_pair(nums2[j], -1));
            else find_res.insert(make_pair(nums2[j], res.top()));
            res.push(nums2[j]);
        }
        for(int i = 0; i < nums1.size(); ++i){
            result.push_back(find_res[nums1[i]]);
        }
        return result;
    }
};