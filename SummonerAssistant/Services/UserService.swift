//
//  UserService.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation

class UserService {
    
    static let userDefaults = UserDefaults.standard

    static func getUserInfo(summonerName: String, resolve: @escaping (_ summoner: SummonerInfo) -> (), reject: @escaping () -> ()) {
        if let summoner = userDefaults.value(forKey: summonerName) {
            resolve(summoner as! SummonerInfo)
        } else {
            reject()
        }
    }
    
    static func updateUser(summoner: SummonerInfo) {
        userDefaults.set(summoner, forKey: summoner.name)
    }
    
}
