//
//  viewModel.swift
//  gymList
//
//  Created by David Puksanskis on 15/07/2025.
//

import Foundation
import UIKit
import CoreData



class ExerciseAPI {
    
    static func fetchAndSaveExercises(from endpoint: String, completion: @escaping () -> Void) {
        
            
            guard let url = URL(string: "http://127.0.0.1:8000/exercise/\(endpoint)") else { return }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    print("No data")
                    return
                }
                do {
                    let decoded = try JSONDecoder().decode([Exercise].self, from: data)
                    print("Get \(decoded.count) exercises")
                    
                    CoreDataManager.shared.saveExercises(decoded) {
                        completion()
                    }
                    
                } catch {
                    print("Decoded error:", error)
                }
            }.resume()
    }
    
    
}
