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

    static func getSummonerName(resolve: @escaping (_ summoner: String, _ region: String) -> (), reject: @escaping () -> ()) {
        if let summoner = userDefaults.value(forKey: "summonerName"), let region = userDefaults.value(forKey: "region") {
            resolve(summoner as! String, region as! String)
        } else {
            reject()
        }
    }
    
    static func updateSummonerName(summoner: String, region: String) {
        userDefaults.set(summoner, forKey: "summonerName")
        userDefaults.set(region, forKey: "region")
    }
    
}
