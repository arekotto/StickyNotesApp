//
//  StorageServiceEngine.cpp
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#include "StorageServiceEngine.hpp"

const char * StorageServiceEngine::getItem(std::string uid) {
    for(auto item: database) {
        if (item->id == uid) {
            auto copiedData = new std::string(item->data);
            return (* copiedData).c_str();
        }
    }
    return nullptr;
}

void StorageServiceEngine::insertItem(const char * data, std::string uid) {
    auto copiedData = new std::string(data);
    auto *item = new StorableItem { uid, (* copiedData).c_str() };
    database.push_back(item);
}

void StorageServiceEngine::removeItem(std::string uid) {
    for(int i = 0; i < 5; i++) {
        auto item = database[i];
        if (item->id == uid) {
            database.erase(database.begin() + i);
            delete item;
            return;
        }
    }
}
