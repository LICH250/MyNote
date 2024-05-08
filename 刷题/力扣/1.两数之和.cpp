#include <iostream>
#include <vector>


using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int flag = 0;
        int i, j;
        for(i = 0; i < nums.size(); i++){
            int target_else = target - nums[i];
            for(j = i + 1; j < nums.size(); j++){
                if(nums[j] == target_else){
                    flag = 1;
                    break;
                }
            }
            if(flag) break;
        }
        vector<int> result;
        result.push_back(i);
        result.push_back(j);
        return result;
    }
};

int main(){
    cout << "Solution" << endl;
    return 0;
}