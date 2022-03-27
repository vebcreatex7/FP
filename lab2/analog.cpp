#include <iostream>
#include <list>
#include <iterator>
#include <algorithm>



void individuals(std::list<int>& l) {
    std::list<int>::iterator it1 = l.begin();
    while(it1 != l.end()) {
        int flag = 0;
        std::list<int>::iterator it2 = it1;
        while(it2 != l.end()) {
            if (*it2 == *it1 and it2 != it1) {
                it2 = l.erase(it2);
                flag = 1;
            } else 
                it2++;
        }
        if (flag == 1)
            it1 = l.erase(it1);
        else
            it1++;

    }
}


int main() {
    std::list<int> l;
    size_t n = 0;
    std::cin >> n;
    for (size_t i = 0; i < n; ++i) {
        int tmp;
        std::cin >> tmp;
        l.push_back(tmp);
    }
    individuals(l);
    for (auto a : l) {
        std::cout << a << ' ';
    }
    std::cout << '\n';
}