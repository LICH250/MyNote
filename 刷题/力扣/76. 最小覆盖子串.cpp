class Solution {
public:
    unordered_map<char, int> t_map, s_map;
    bool cmp(){
        for(const auto& it:t_map){
            if(s_map[it.first] < it.second)
                return false;
        }
        return true;
    }

    string minWindow(string s, string t) {
        for(int i = 0; i < t.size(); ++i){
            t_map[t[i]]++;
        }
        int left = 0, right = 0;
        int min = s.size(), fLeft, fRight;
        bool flag = 0;
        while(right < s.size()){
            while(right <s.size() && !cmp()){
                s_map[s[right]]++;
                right++;
            }
            while(left <= right && cmp()){
                flag = 1;
                s_map[s[left]]--;
                left++;
            }
            if(min > right - left){
                min = right - left;
                fLeft = left - 1;
                fRight = right;
            }
        }
        return flag ? s.substr(fLeft, fRight-fLeft) : "";

    }
};