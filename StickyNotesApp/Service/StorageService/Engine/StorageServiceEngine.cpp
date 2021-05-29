//
//  StorageServiceEngine.cpp
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#include "StorageServiceEngine.hpp"
#include "StorableItemUtils.hpp"
#include <fstream>

const std::string StorageServiceEngine::databaseFileName = "db.txt";

const char * StorageServiceEngine::getItem(std::string uid) {
    for (auto item: database) {
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
    for ( ; i < numberOfItems; i++) {
        auto copiedData = new std::string(database[i]->data);
        items[i] = (* copiedData).c_str();
    }
    items[i] = NULL;
    return items;
}

const char ** StorageServiceEngine::getAllItemIDs() {
    auto numberOfItems = database.size();
    const char ** items = new const char * [numberOfItems + 1];
    int i = 0;
    for ( ; i < numberOfItems; i++) {
        auto copiedData = new std::string(database[i]->id);
        items[i] = (* copiedData).c_str();
    }
    items[i] = NULL;
    return items;
}

void StorageServiceEngine::insertItem(const char * data, std::string uid) {
    auto copiedData = new std::string(data);
    auto * item = new StorableItem { uid, (* copiedData).c_str() };
    database.push_back(item);
}

void StorageServiceEngine::updateItem(const char *data, std::string uid) {
    for (int i = 0; i < database.size(); i++) {
        if (database[i]->id == uid) {
            auto copiedData = new std::string(data);
            database[i]->data = (* copiedData).c_str();
            return;
        }
    }
}

void StorageServiceEngine::removeItem(std::string uid) {
    for (int i = 0; i < database.size(); i++) {
        auto item = database[i];
        if (item->id == uid) {
            database.erase(database.begin() + i);
            delete item;
            return;
        }
    }
}

std::string StorageServiceEngine::databasePath() {
    char buffer[256];
    strcpy(buffer, getenv("HOME"));
    strcat(buffer, "/Documents/");
    strcat(buffer, databaseFileName.c_str());
    return std::string(buffer);
}

std::istream& operator>> (std::istream & stream, StorableItem & item) {
    return StorableItemUtils::getItem(stream, item);
}

void StorageServiceEngine::save() {
    auto fullPath = databasePath();
    std::ofstream file(fullPath);
    for (const StorableItem * item : database) {
        StorableItemUtils::putItem(file, *item);
        file << '\n';
    }
}

void StorageServiceEngine::load() {
    database.clear();
    auto fullPath = databasePath();
    std::ifstream file(fullPath);
    StorableItem tempItem;
    while (file >> tempItem) {
        StorableItem * item = new StorableItem(tempItem);
        database.push_back(item);
    }
}

