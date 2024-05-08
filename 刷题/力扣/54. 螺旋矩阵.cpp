class Solution {
public:
    vector<int> spiralOrder(vector<vector<int>>& matrix) {
        int row_min = 0, row_max = matrix.size();
        int col_min = 0, col_max = matrix[0].size();
        vector<int> result;
        while(row_min < row_max && col_min < col_max){
            
            //左到右
            for(int i = col_min; i < col_max; ++i){
                result.push_back(matrix[row_min][i]);
            }
            ++row_min;
            if(row_min >= row_max) break;

            //上到下
            for(int i = row_min; i < row_max; ++i){
                result.push_back(matrix[i][col_max-1]);
            }
            --col_max;
            if(col_min >= col_max) break;

            //右到左
            for(int i = col_max-1; i >= col_min; --i){
                result.push_back(matrix[row_max-1][i]);
            }
            --row_max;
            if(row_min >= row_max) break;

            //从下到上
            for(int i = row_max-1; i >= row_min; --i){
                result.push_back(matrix[i][col_min]);
            }
            ++col_min;
            if(col_min >= col_max) break;
        }
        return result;
    }
};