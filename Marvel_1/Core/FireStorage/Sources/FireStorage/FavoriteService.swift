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
    func markAsFavorite<T: Encodable>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void) {
        let uuid = UUID().uuidString
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        do {
            let data = try encoder.encode(characterModel)
            var dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
            
            // Adicionar characterID e isFavorite ao dicionário
            dict["characterID"] = characterID
            dict["isFavorite"] = isFavorite
            
            // Salvar o dicionário no Firestore
            Firestore.firestore().collection("Characters Favorites")
                .document(uuid)
                .setData(dict) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
        } catch {
            completion(.failure(error))
        }
    }
    
    func unmarkAsFavorite(characterID: Int, isFavorite: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        Firestore.firestore().collection("Characters Favorites")
            .whereField("characterID", isEqualTo: characterID)
            .getDocuments { snapshot, error in
                guard let document = snapshot?.documents.first else {
                    completion(.failure(error ?? NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                
                if isFavorite {
                    completion(.success(()))
                } else {
                    Firestore.firestore().collection("Characters Favorites")
                        .document(document.documentID)
                        .delete { error in
                            if let error = error {
                                completion(.failure(error))
                            } else {
                                completion(.success(()))
                            }
                        }
                }
            }
    }
}
