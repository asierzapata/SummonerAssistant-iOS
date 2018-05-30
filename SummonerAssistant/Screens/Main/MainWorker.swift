//
//  MainWorker.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Firebase

typealias responseHandler = (_ response:MainModel.Fetch.Response) ->()

enum MainFetchTypes {
    case MostFrequentChampions
    case SummonerInfo
}

class MainWorker {
    
    lazy var functions = Functions.functions()

    func fetchMostFrequentChampions(summonerName: String!, region: String!, season: String!, success:@escaping(responseHandler), fail:@escaping(responseHandler)) {
        let callParameters = ["summonerId": summonerName, "region": region, "season": season]
        functions.httpsCallable("getMostFrequentChampions").call(callParameters) { (result: HTTPSCallableResult?, error: Error?) in
            if let error = error as NSError? {
                print(error.localizedDescription)
                fail(MainModel.Fetch.Response(message: error.localizedDescription, isError: true, data: [] ))
                return
            }
            
            let data = result?.data as! Array<Dictionary<String,AnyObject>>
            let championArray: Array<ChampionsStatisticsModel> = []
            
//            for dictionary in data {
//                championArray.append(ChampionsStatisticsModel(dictionary))
//            }
            
            success(MainModel.Fetch.Response(message:nil, isError: false, data: championArray))
        }
    }
    
    func fetchSummonerInfo(summonerName: String!, region: String!, success:@escaping(responseHandler), fail:@escaping(responseHandler)) {
        let callParameters = ["summonerName": summonerName, "region": region]
        functions.httpsCallable("getSummonerInfoByName").call(callParameters) { (result: HTTPSCallableResult?, error: Error?) in
            if let error = error as NSError? {
                print(error.localizedDescription)
                fail(MainModel.Fetch.Response(message: error.localizedDescription, isError: true, data: [] ))
                return
            }

            let data = result?.data as! Dictionary<String,AnyObject>
            
            let summonerInfo: SummonerInfo = SummonerInfo(dictionary: data)

            success(MainModel.Fetch.Response(message:nil, isError: false, data: summonerInfo))
        }
    }
}
