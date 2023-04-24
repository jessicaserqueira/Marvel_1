//
//  File.swift
//  
//
//  Created by Jessica Serqueira on 15/03/23.
//

import FirebaseFirestore
import AppData
import Foundation
import FirebaseAuth

public class FavoriteService {
    private let userId: String
    
    public init(){
        if let currentUser = Auth.auth().currentUser {
            self.userId = currentUser.uid
        } else {
            self.userId = "default value"
        }
    }

    
    func markAsFavorite<T: Encodable>(characterID: Int, isFavorite: Bool, characterModel: T, completion: @escaping (Result<Void, Error>) -> Void) {
        let uuid = UUID().uuidString
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        do {
            let data = try encoder.encode(characterModel)
            var dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
            
            dict["characterID"] = characterID
            dict["isFavorite"] = isFavorite
            
            Firestore.firestore().collection("users")
                .document(userId)
                .collection("charactersFavorites")
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
        Firestore.firestore().collection("users")
            .document(userId)
            .collection("charactersFavorites")
            .whereField("characterID", isEqualTo: characterID)
            .getDocuments { snapshot, error in
                guard let document = snapshot?.documents.first else {
                    completion(.failure(error ?? NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                
                if isFavorite {
                    completion(.success(()))
                } else {
                    Firestore.firestore().collection("users")
                        .document(self.userId)
                        .collection("charactersFavorites")
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
    
    public func getFavorites<T: Decodable>(completion: @escaping (Result<[T], Error>) -> Void) {
        Firestore.firestore().collection("users").document(userId).collection("charactersFavorites").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            DispatchQueue.main.async {
                let characters = snapshot?.documents.compactMap { doc -> T? in
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: doc.data(), options: [])
                        let character = try JSONDecoder().decode(T.self, from: jsonData)
                        return character
                    } catch {
                        print("Error decoding character: \(error)")
                        return nil
                    }
                } ?? []

                completion(.success(characters))
            }
        }
    }
}
