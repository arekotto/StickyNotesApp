//
//  StorageServiceEngine.hpp
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#ifndef StorageService_hpp
#define StorageService_hpp

#include <stdio.h>
#include <vector>
#include "StorableItem.hpp"

class StorageServiceEngine {
    std::vector<StorableItem *> database;
public:
    const char * getItem(std::string uid);
    const char ** getAllItems();
    void insertItem(const char * data, std::string uid);
    void removeItem(std::string uid);
};

#endif /* StorageService_hpp */
