class Solution {
public:
    int trap(vector<int>& height) {
        vector<int> left(height.size());
        vector<int> right(height.size());
        int forleft = 0;
        int forright = 0;
        for(int i = 0; i < height.size(); ++i){
            forleft = max(forleft, height[i]);
            left[i] = forleft;
        }
        for(int j = height.size()-1; j >=0; --j){
            forright = max(forright, height[j]);
            right[j] = forright;
        }
        int result = 0;
        for(int i = 0; i < height.size(); ++i){
            result += min(left[i], right[i]) - height[i];
        }
        return result;
    }
};