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

    func fetch(summonerName: String!, region: String!, season: String!, success:@escaping(responseHandler), fail:@escaping(responseHandler)){
        let callParameters = ["summonerId": summonerName, "region": region, "season": season]
        print(callParameters)
        functions.httpsCallable("getMostFrequentChampions").call(callParameters) { (result: HTTPSCallableResult?, error: Error?) in
            print(">>>>> Function succesfully called with result")
            print(result?.data as Any)
            if let error = error as NSError? {
                print(error.localizedDescription)
                fail(MainModel.Fetch.Response(message: error.localizedDescription, isError: true, data: [] ))
                return
            }
            let championArray: Array = result?.data as! Array<ChampionsStatisticsModel>
            
            print(championArray)
            
            success(MainModel.Fetch.Response(message:nil, isError: false, data: championArray))
        }
    }
}
