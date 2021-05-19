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

const char ** StorageServiceEngine::getAllItems() {
    auto numberOfItems = database.size();
    const char ** items = new const char * [numberOfItems + 1];
    int i = 0;
    for( ; i < numberOfItems; i++) {
        auto copiedData = new std::string(database[i]->data);
        items[i] = (* copiedData).c_str();
    }
    items[i] = NULL;
    return items;
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
