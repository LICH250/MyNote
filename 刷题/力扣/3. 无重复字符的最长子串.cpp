class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        unordered_set<char> myset;
        int left = 0, right = 0;
        int maxsize = 0;
        while(right < s.size()){
            while(right < s.size() && myset.find(s[right]) == myset.end()){
                myset.insert(s[right]);
                ++right;
            }
            maxsize = max(maxsize, right - left);
            myset.erase(s[left]);
            ++left;
        }
        return maxsize;
    }
};