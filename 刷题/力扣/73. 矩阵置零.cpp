class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        vector<int> i_tag, j_tag;
        for(int i = 0; i < matrix.size(); ++i){
            for(int j = 0; j < matrix[0].size(); ++j){
                if(!matrix[i][j]){
                    i_tag.push_back(i);
                    j_tag.push_back(j);
                }
            }
        }
        cout <<"i_tag " << i_tag.size() << endl;
        cout <<"j_tag " << j_tag.size() << endl;
        for(const auto& i_c : i_tag){
            for(int j_c = 0; j_c < matrix[0].size(); ++j_c){
                matrix[i_c][j_c] = 0;
                cout <<"hello" <<endl;
            }
        }
        for(const auto& j_c : j_tag){
            for(int i_c = 0; i_c < matrix.size(); ++i_c){
                matrix[i_c][j_c] = 0;
                cout <<"hello" <<endl;
            }
        }
    }
};