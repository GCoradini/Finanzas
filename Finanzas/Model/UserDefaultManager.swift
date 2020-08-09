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
        let decoder = JSONDecoder()
        let encoder = JSONEncoder()
        if let data = defaults.data(forKey: KeysUD.users.rawValue) {
            do {
                users = try decoder.decode(Array.self, from: data) as [User]
            } catch {
                print("No se pudo obtener los usuarios")
            }
        }
        users.append(user)
        do {
            let encodeData = try encoder.encode(users)
            defaults.set(encodeData, forKey: KeysUD.users.rawValue)
        } catch {
            print("No se pudo cargar un usuario")
        }
    }
    
    func getUsers()-> [User] {
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

    func setLoguedUser(_ user: User) {
        let encoder = JSONEncoder()
        do {
            let encodeData = try encoder.encode(user)
            defaults.set(encodeData, forKey: KeysUD.loguedUser.rawValue)
        } catch {
            print("No se pudo asignar el usuario logueado")
        }
    }
    
    func clearUsers(){
        defaults.removeObject(forKey: KeysUD.users.rawValue)
    }
}



