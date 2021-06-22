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
    static std::string databasePath();
    std::vector<StorableItem *> database;
public:
    const char * getItem(std::string uid);
    const char ** getAllItems();
    const char ** getAllItemIDs();
    void insertItem(const char * data, std::string uid);
    void updateItem(const char * data, std::string uid);
    void removeItem(std::string uid);
    void save();
    void load();
};

#endif /* StorageService_hpp */
