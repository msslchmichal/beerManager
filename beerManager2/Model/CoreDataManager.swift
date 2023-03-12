//
//  CoreDataManager.swift
//  beerManager2
//
//  Created by Michał Massloch on 08/03/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "beerManager2")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func createHop() -> Hop {
        let context = persistentContainer.viewContext
        return Hop(context: context)
    }
    
    func save(_ hop: Hop) {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func delete(_ hop: Hop) {
        let context = persistentContainer.viewContext
        context.delete(hop)
        save(hop)
    }
    
    func fetchHops() -> [Hop] {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<Hop> = Hop.fetchRequest()
        do {
            let hops = try context.fetch(request)
            return hops
        } catch {
            fatalError("Failed to fetch hops: \(error)")
        }
    }
}
