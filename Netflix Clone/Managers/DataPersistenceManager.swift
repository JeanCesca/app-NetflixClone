//
//  DataPersistenceManager.swift
//  Netflix Clone
//
//  Created by Jean Ricardo Cesca on 18/08/22.
//

import Foundation
import UIKit
import CoreData

class DataPersistenceManager {
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
    //CREATE
    func downloadTitle(model: Title, completion: @escaping (Result<Void, DatabaseError>) -> Void) {
        
        //Instanciando o AppDelegate (criando referência)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //Context = onde irei fazer o CRUD para atualizar o DataBase
        let context = appDelegate.persistentContainer.viewContext
        
        //Item que irei armazenar dentro do DataBase
        let item = TitleItem(context: context)
        item.original_title = model.original_title
        item.original_name = model.original_name
        item.id = Int64(model.id)
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.media_type = model.media_type
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)
        
        //READ
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(.failedToSaveData))
        }
    }
    
    //UPDATE
    func fetchTitlesFromDataBase(completion: @escaping (Result<[TitleItem], DatabaseError>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<TitleItem> = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(.failedToFetchData))
        }
    }
    
    //DELETE
    func deleteTitle(model: TitleItem, completion: @escaping (Result<Void, DatabaseError>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(.failedToDeleteData))
        }
    }
}
