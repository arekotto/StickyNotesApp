//
//  StorageServiceEngine.cpp
//  StickyNotesApp
//
//  Created by Arek Otto on 10/05/2021.
//

#include "StorageServiceEngine.hpp"
#include "StorableItemUtils.hpp"
#include <fstream>

static std::string_view databaseFileName{"db.txt"};

std::string * StorageServiceEngine::getItem(std::string uid) {
    for (auto item: database) {
        if (item->id == uid) {
            return new std::string(item->data);
        }
    }
    return nullptr;
}

std::vector<std::string> StorageServiceEngine::getAllItems() {
    std::vector<std::string> itemIDs;
    for (auto item : database) {
        itemIDs.push_back(item->data);
    }
    return itemIDs;
}

std::vector<std::string> StorageServiceEngine::getAllItemIDs() {
    std::vector<std::string> itemIDs;
    for (auto item : database) {
        itemIDs.push_back(item->id);
    }
    return itemIDs;
}

void StorageServiceEngine::insertItem(std::string data, std::string uid) {
    auto * item = new StorableItem { uid, data };
    database.push_back(item);
}

void StorageServiceEngine::updateItem(std::string data, std::string uid) {
    for (int i = 0; i < database.size(); i++) {
        if (database[i]->id == uid) {
            database[i]->data = data;
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
            item = nullptr;
            return;
        }
    }
}

std::string StorageServiceEngine::databasePath() {
    std::string env(getenv("HOME"));
    std::string folder = "/Documents/";
    return env + folder + std::string{databaseFileName};
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

