//
//  SummonerDetailPresenterTests.swift
//  Summoner Assistant
//
//  Created by asierzapata on 05/22/2018.
//  Copyright © 2018 . All rights reserved.
//

import XCTest

class AddPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: SummonerDetailInteractorInputProtocol {

    }

    class MockWireframe: SummonerDetailWireFrameProtocol {

    }

    class MockViewController: SummonerDetailViewProtocol {

        func setupInitialState() {

        }
    }
}
