//
//  StorableItemUtils.cpp
//  StickyNotesApp
//
//  Created by Arek Otto on 29/05/2021.
//

#include "StorableItemUtils.hpp"
#include <sstream>
#include <vector>

std::ostream& StorableItemUtils::putItem(std::ostream & stream, const StorableItem & item){
    return stream << item.id << ' ' << base64_encode(item.data);
}

std::istream& StorableItemUtils::getItem(std::istream & stream, StorableItem & item) {
    std::string line;
    if (std::getline(stream >> std::ws, line)) {
        std::istringstream stringStream(line);
        std::string data;
        if (stringStream >> item.id >> data) {
            item.data = std::string(base64_decode(data));
            return stream;
        }
    }
    
    stream.clear(stream.failbit);
    return stream;
}

// MARK: - helpers

std::string StorableItemUtils::base64_encode(const std::string &in) {
    
    std::string out;
    
    int val = 0, valb = -6;
    for (unsigned char c : in) {
        val = (val << 8) + c;
        valb += 8;
        while (valb >= 0) {
            out.push_back("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[(val>>valb)&0x3F]);
            valb -= 6;
        }
    }
    if (valb>-6) out.push_back("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[((val<<8)>>(valb+8))&0x3F]);
    while (out.size()%4) out.push_back('=');
    return out;
}

std::string StorableItemUtils::base64_decode(const std::string &in) {
    
    std::string out;
    
    std::vector<int> T(256,-1);
    for (int i=0; i<64; i++) T["ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"[i]] = i;
    
    int val=0, valb=-8;
    for (unsigned char c : in) {
        if (T[c] == -1) break;
        val = (val << 6) + T[c];
        valb += 6;
        if (valb >= 0) {
            out.push_back(char((val>>valb)&0xFF));
            valb -= 8;
        }
    }
    return out;
}
