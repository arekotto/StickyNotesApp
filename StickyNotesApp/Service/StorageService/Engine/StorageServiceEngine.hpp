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
    std::string * getItem(std::string uid);
    std::vector<std::string> getAllItems();
    std::vector<std::string> getAllItemIDs();
    void insertItem(std::string data, std::string uid);
    void updateItem(std::string data, std::string uid);
    void removeItem(std::string uid);
    void save();
    void load();
};

#endif /* StorageService_hpp */
