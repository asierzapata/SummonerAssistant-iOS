//
//  MainWorker.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Firebase

typealias responseHandler = (_ response:MainModel.Fetch.Response) ->()

class MainWorker {
    
    lazy var functions = Functions.functions()

    func fetchMostFrequentChampions(summonerName: String!, region: String!, season: String!, success:@escaping(responseHandler), fail:@escaping(responseHandler)) {
        let callParameters = ["summonerId": summonerName, "region": region, "season": season]
        functions.httpsCallable("getMostFrequentChampionsBySummonerId").call(callParameters) { (result: HTTPSCallableResult?, error: Error?) in
            if let error = error as NSError? {
                print(error.localizedDescription)
                fail(MainModel.Fetch.Response(message: error.localizedDescription, isError: true, data: [] ))
                return
            }
            
            let data = result?.data as! Array<Dictionary<String,AnyObject>>
            var championArray: Array<ChampionsStatisticsModel> = []
            
            for dictionary in data {
                championArray.append(ChampionsStatisticsModel(dictionary: dictionary))
            }
            
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
            
            var summonerInfo: SummonerInfo = SummonerInfo(dictionary: data)
            summonerInfo.region = region

            success(MainModel.Fetch.Response(message:nil, isError: false, data: summonerInfo))
        }
    }
    
    func fetchMatchHistory(summonerName: String!, region: String!, type: String!, start: String!, success:@escaping(responseHandler), fail:@escaping(responseHandler)){
        let callParameters = ["summonerName": summonerName, "region": region, "type": type, "start": start ]
        functions.httpsCallable("getMatchHistoryBySummonerName").call(callParameters) { (result: HTTPSCallableResult?, error: Error?) in
            if let error = error as NSError? {
                print(error.localizedDescription)
                fail(MainModel.Fetch.Response(message: error.localizedDescription, isError: true, data: [] ))
                return
            }
            
            let dict = result?.data as! Dictionary<String,AnyObject>
            let data = dict["games"] as! Array<Dictionary<String,AnyObject>>
            print(data)
            var matchList: Array<MatchInfoModel> = []
            
            for dictionary in data {
                matchList.append(MatchInfoModel(dictionary: dictionary))
            }
            
            success(MainModel.Fetch.Response(message:nil, isError: false, data: matchList))
        }
    }
}
