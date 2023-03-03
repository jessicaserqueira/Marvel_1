//
//  File.swift
//  
//
//  Created by NMAS Amaral on 24/02/23.
//

import Foundation
import FirebaseFirestore

struct Item: Identifiable, Codable {
    var id: Int
    var title: String
    var isFaved: Bool

    static var sampleItems: [Item] {
        var tempList = [Item]()
        
        for i in 1...20 {
            let id = i
            let title = "Title \(i)"
            
            tempList.append(Item(id: id, title: title, isFaved: false))
        }
        return tempList
    }
}

public class FavoriteDataBase {
    let FAV_KEY = "fav_key"
    
    public init() {
        
    }
    
    public func debugDataBase() {
        let db = Firestore.firestore()

        db.collection("character")
            .document("Marvel")
            .setData([
            "name" : "Miranha",
            "HQ" : "Miranha 1",
            "Age" : "17 years"
        ]) { (error:Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print ("Document was succesfully created and written.")
            }
        }
    }
    
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
}
