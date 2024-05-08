class Solution {
public:
    vector<int> findAnagrams(string s, string p) {
        if(s.size() < p.size()) return vector<int> ();
        vector<int> result;
        vector<int> rp(26);
        for(int i = 0; i < p.size(); ++i)
            ++rp[p[i] - 'a'];
        int left = 0;
        int right = 0;
        vector<int> rs(26);
        while(right < s.size()){
            while(right < s.size() && right < left + p.size()){
                ++rs[s[right] - 'a'];
                ++right;
            }
            if(rs == rp) result.push_back(left);
            --rs[s[left] - 'a'];
            ++left;
        }
        return result;
    }
};