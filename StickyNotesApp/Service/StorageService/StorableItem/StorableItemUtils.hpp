//
//  StorableItemUtils.hpp
//  StickyNotesApp
//
//  Created by Arek Otto on 29/05/2021.
//

#ifndef StorableItemUtils_hpp
#define StorableItemUtils_hpp

#include <stdio.h>
#include <iostream>
#include "StorableItem.hpp"

class StorableItemUtils {
    static std::string base64_encode(const std::string & in);
    static std::string base64_decode(const std::string & in);
public:
    static std::ostream& putItem(std::ostream & stream, const StorableItem & item);
    static std::istream& getItem(std::istream & stream, StorableItem & item);
};

#endif /* StorableItemUtils_hpp */
