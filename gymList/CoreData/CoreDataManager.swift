//
//  CoreDataManager.swift
//  gymList
//
//  Created by David Puksanskis on 14/07/2025.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    
    //MARK: - Init
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "ExerciseData")
        
        persistentContainer.loadPersistentStores { description, error in
            if error != nil {
                fatalError("Initializing error CoreData")
            }
        }
    }
    
    
    // MARK: Save context
    
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
                print("CoreData saved")
            } catch {
                print("Saving error: \(error)")
            }
        }
    }
    
    func saveExercises(_ exercises: [Exercise], completion: @escaping () -> Void) {
        
        let context = CoreDataManager.shared.context
        clearAllExercises()
        
        
        let dispatchGroup = DispatchGroup()
        
        for ex in exercises {
            let entity = ExerciseEntity(context: context)
            
            entity.muscleGroup = ex.muscleGroup
            entity.exercise = ex.exercise
            entity.sets = Int16(ex.sets)
            entity.reps = Int16(ex.reps)
            entity.imageUrl = ex.imageUrl
            entity.muscleImageUrl = ex.muscleImageUrl
            
            
            dispatchGroup.enter()
            downloadImageAsync(from: ex.muscleImageUrl) { data in
                entity.muscleImageData = data
                dispatchGroup.leave()
            }
            dispatchGroup.enter()
            downloadImageAsync(from: ex.imageUrl) { data in
                entity.imageData = data
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            do {
                try context.save()
                print("Saved in CoreData with Images")
            } catch {
                print("Error to save:", error)
            }
        }
    }
    
    
    func fetchExercise() -> [ExerciseEntity] {
        let request = NSFetchRequest<ExerciseEntity>(entityName: "ExerciseEntity")
        
        
        
        do {
            return try context.fetch(request)
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }
    
    
    
    
    func clearAllExercises() {
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = ExerciseEntity.fetchRequest()
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            print("Data is deleted")
        } catch {
            print("Not deleted")
        }
    }
    
}
