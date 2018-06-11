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

    static func getSummonerName(resolve: @escaping (_ summoner: String) -> (), reject: @escaping () -> ()) {
        if let summoner = userDefaults.value(forKey: "summonerName") {
            resolve(summoner as! String)
        } else {
            reject()
        }
    }
    
    static func updateSummonerName(summoner: String) {
        userDefaults.set(summoner, forKey: "summonerName")
    }
    
}
