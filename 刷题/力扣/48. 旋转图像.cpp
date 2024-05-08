class Solution {
public:
    void rotate(vector<vector<int>>& matrix) {

        int s = matrix.size();
        for(int i = 0; i < s; ++i){
            for(int j = 0; j < s/2; ++j){
                swap(matrix[i][j], matrix[i][s-1-j]);
            }
        }
        for(int i = 0; i < s; ++i){
            for(int j = 0; j < s; ++j){
                if(i + j <= s -2){
                    swap(matrix[i][j], matrix[s-1-j][s-1-i]);
                }
            }
        }

    }
};