//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import FirebaseFirestore
import AppData
import Foundation

public class FavoriteService {
    
    public init(){}
    
    func markAsFavorite(completion: @escaping (Result<CharacterResponseDTO, Error>) -> Void) {
        let sampleData = Data("Sample Data".utf8)
        let decoder = PropertyListDecoder()
        let character = try! decoder.decode(CharacterResponseDTO.self, from: sampleData)
        let dict = character.toDictionary
        let uuid = UUID().uuidString
        
        Firestore.firestore().collection("favorites")
            .document(uuid)
            .setData([
                "name": dict["name"] as? String ?? "",
                "thumbnail": dict["thumbnail"] as? String ?? "",
                "uuid": uuid,
            ]) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(character))
                }
            }
    }
    
    func unmarkAsFavorite(completion: @escaping (Result<CharacterResponseDTO, Error>) -> Void) {
        let sampleData = Data("Sample Data".utf8)
        let decoder = PropertyListDecoder()
        let character = try! decoder.decode(CharacterResponseDTO.self, from: sampleData)
        Firestore.firestore().collection("favorites")
            .whereField("name", isEqualTo: character.name)
            .whereField("thumbnail", isEqualTo: character.thumbnail)
            .getDocuments { snapshot, error in
                guard let document = snapshot?.documents.first else {
                    completion(.failure(error ?? NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                
                Firestore.firestore().collection("favorites")
                    .document(document.documentID)
                    .delete { error in
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            completion(.success(character))
                        }
                    }
            }
    }
}
