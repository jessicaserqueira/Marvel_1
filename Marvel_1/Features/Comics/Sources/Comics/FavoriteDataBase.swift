//
//  File.swift
//  
//
//  Created by NMAS Amaral on 24/02/23.
//

import Foundation
import FirebaseFirestore

public class FavoriteDataBase {
    
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
}
