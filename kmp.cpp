#include <iostream>
#include <string>
#include <vector>
using namespace std;


vector<int> computeArr(string pattern)
{
    int n = pattern.size();
    vector<int> preArr(n);
    preArr[0] = 0;
    int i = 1;
    int len = 0;
    while(i < n){
        if(pattern[i] == pattern[len]){
            ++len;
            preArr[i] = len;
            ++i;
        }

        else{
            if(len != 0)
                len = preArr[len - 1];
            else{
                preArr[i] = 0;
                ++i;
            }
        }
    }

    return preArr;
}


void kmp(string text, string pattern)
{
    vector<int> preArr = computeArr(pattern);
    int i = 0;
    int j = 0;
    while(i < text.size()){
        if(text[i] == pattern[j]){
            ++i;
            ++j;
        }

        if(j == pattern.size()){
            cout << "Found at: " << i - j << endl;
            j = preArr[j - 1];
        }
        else if(j < pattern.size() && text[i] != pattern[j]){
            if(j != 0)
                j = preArr[j - 1];
            else
                ++i;
        }
    }
}


int main()
{
    kmp("ABABDABACDABABCABAB", "ABABCABAB");
}
