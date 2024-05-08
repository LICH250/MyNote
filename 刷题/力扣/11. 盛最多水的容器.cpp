class Solution {
public:
    int maxArea(vector<int>& height) {
        int left = 0, right = height.size() - 1;
        int result = 0;
        while(left < right){
            int current = 0;
            if(height[left] < height[right]){
                current = (right - left) * height[left];
                left++;
            }
            else{
                current = (right - left) * height[right];
                right--;
            }
            result = max(result, current);
        }
        return result;
    }
};