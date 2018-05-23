//
//  SummonerDetailProtocols.swift
//  Summoner Assistant
//
//  Created by asierzapata on 05/22/2018.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

protocol SummonerDetailViewProtocol: class {
    var presenter: SummonerDetailPresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol SummonerDetailWireFrameProtocol: class {
    static func presentSummonerDetailModule(fromView view: AnyObject)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol SummonerDetailPresenterProtocol: class {
    var view: SummonerDetailViewProtocol? { get set }
    var interactor: SummonerDetailInteractorInputProtocol? { get set }
    var wireFrame: SummonerDetailWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
}

protocol SummonerDetailInteractorOutputProtocol: class {
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol SummonerDetailInteractorInputProtocol: class
{
    var presenter: SummonerDetailInteractorOutputProtocol? { get set }
    var APIDataManager: SummonerDetailAPIDataManagerInputProtocol? { get set }
    var localDatamanager: SummonerDetailLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
}

protocol SummonerDetailDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol SummonerDetailAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol SummonerDetailLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
