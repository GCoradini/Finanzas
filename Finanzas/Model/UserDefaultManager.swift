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
    case loggedUser
}

class UserDefaultManager {
    var users: [User]
    let defaults: UserDefaults

    init() {
        users = []
        defaults = UserDefaults.standard
    }
    
    func saveUser(_ user: User) -> Bool {
        let encoder = JSONEncoder()
        users = getUsers()
        users.append(user)
        do {
            let encodeData = try encoder.encode(users)
            defaults.set(encodeData, forKey: KeysUD.users.rawValue)
        } catch {
            return false
        }
        return true
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
    
    func setLoggedUser(_ user: User) {
        let encoder = JSONEncoder()
        do {
            let encodeData = try encoder.encode(user)
            defaults.set(encodeData, forKey: KeysUD.loggedUser.rawValue)
        } catch {
            print("No se pudo asignar el usuario logueado")
        }
    }
    
    func getLoggeduser() -> User {
        let decoder = JSONDecoder()
        var user = User()
        if let data = defaults.data(forKey: KeysUD.loggedUser.rawValue) {
            do {
                user = try decoder.decode(User.self, from: data) as User
            } catch {
                print("No se pudo obtener el usuario logueado")
            }
        }
        return user
    }
    
    func clearLoguedUser() {
        defaults.removeObject(forKey: KeysUD.loggedUser.rawValue)
    }
    
    func saveTransaction(_ transaction: Transaction, user: String) -> Bool{
        users = getUsers()
        let encoder = JSONEncoder()
        
        if let index = users.firstIndex(where: { $0.username == user }) {
            users[index].transactions.append(transaction)
        }
        
        do {
            let encodeData = try encoder.encode(users)
            defaults.set(encodeData, forKey: KeysUD.users.rawValue)
        } catch {
            return false
        }
        return true
    }
    
    func getTransactions(user: String) -> [Transaction] {
        users = getUsers()
        
        guard let index = users.firstIndex(where: { $0.username == user }) else {
            return []
        }
        return users[index].transactions
    }
}



