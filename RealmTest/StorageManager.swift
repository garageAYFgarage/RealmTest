//
//  StorageManager.swift
//  RealmTest
//
//  Created by iFARA💻 on 28.10.2022.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class StorageManager {
    
   static let shared = StorageManager()
    
    private init() { }
    
    func saveTaskLists(_ taskLists: [TaskList]) {
        try! realm.write {
            realm.add(taskLists)
        }
    }
    
}
