//
//  UserDefaultManager.swift
//  Finanzas
//
//  Created by Usuario on 05/08/2020.
//  Copyright © 2020 Infinixsoft. All rights reserved.
//

import Foundation

enum KeysUD : String {
    case users
    case loguedUser
}

class UserDefaultManager {
    var users: [User]
    let defaults: UserDefaults

    init() {
        users = []
        defaults = UserDefaults.standard
    }
    
    func saveUser(_ user: User) {
        let encoder = JSONEncoder()
        users = getUsers()
        users.append(user)
        do {
            let encodeData = try encoder.encode(users)
            defaults.set(encodeData, forKey: KeysUD.users.rawValue)
        } catch {
            print("No se pudo guardar un usuario")
        }
    }
    
    func getUsers() -> [User] {
        let decoder = JSONDecoder()
        if let data = defaults.data(forKey: KeysUD.users.rawValue) {
            do {
                users = try decoder.decode(Array.self, from: data) as [User]
            } catch {
                print("No se obtener los usuarios")
            }
        }
        return users
    }
    
    func saveTransaction(_ transaction: Transaction, user: String) {
        users = getUsers()
        let encoder = JSONEncoder()
        
        if let index = users.firstIndex(where: { $0.username == user }) {
            users[index].transactions.append(transaction)
        }
        
        do {
            let encodeData = try encoder.encode(users)
            defaults.set(encodeData, forKey: KeysUD.users.rawValue)
        } catch {
            print("No se pudo guardar la transaccion")
        }
    }
    
    func getTransactions(user: String) -> [Transaction] {
        users = getUsers()
        
        guard let index = users.firstIndex(where: { $0.username == user }) else {
            return []
        }
        return users[index].transactions
    }
}



