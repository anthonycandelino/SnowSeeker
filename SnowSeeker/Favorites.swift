//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Anthony Candelino on 2024-10-13.
//

import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    private var key = "Favorites"
    
    init() {
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        // write out data
    }
}
