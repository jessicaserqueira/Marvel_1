//
//  File.swift
//  
//
//  Created by NMAS Amaral on 03/03/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CharacterRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published public var character = [CharacterModel]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("Marvel").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.character = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: CharacterModel.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    func addFavorite(_ character: CharacterModel) {
        do {
            let _ = try db.collection("Marvel").addDocument(from: character)
        }
        catch {
            fatalError("Unable to encode character: \(error.localizedDescription)")
        }
    }
    
    
}


