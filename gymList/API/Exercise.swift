//
//  Exercise.swift
//  gymList
//
//  Created by David Puksanskis on 08/07/2025.
//

import Foundation


struct Exercise: Decodable {
    
    let muscleGroup: String
    let exercise: String
    let sets: Int
    let reps: Int
    let imageUrl: String
    let muscleImageUrl: String
}


/*
extension Exercise {
    static func loadBuildMuscles(completion: @escaping ([Exercise])-> Void) {
        guard let url = URL(string: "http://127.0.0.1:8000/exercise/build-muscle") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                print("Error1")
                return
            }
            guard let data = data else { return }
            
            do {
                let decoded = try JSONDecoder().decode([Exercise].self, from: data)
                DispatchQueue.main.async {
                    completion(decoded)
                }
            } catch {
                print("Decoding error: \(error)")
            }
            
        }.resume()
    }
    */


