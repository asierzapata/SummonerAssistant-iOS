//
//  MainController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 29/05/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

protocol MainViewControllerInput: class {
    func successFetchedItems(viewModel: MainModel.Fetch.ViewModel)
    func errorFetchingItems(viewModel: MainModel.Fetch.ViewModel)
}

class MainViewController: UIViewController, MainViewControllerInput {
    
    var interactor: MainInteractor!
    var router: MainRouter!
    
    // Labels
    @IBOutlet weak var SummonerNameLabel: UILabel!
    @IBOutlet weak var SummonerRegionLabel: UILabel!
    
    // Images
    @IBOutlet weak var FirstUsedChampionImage: UIImageView!
    @IBOutlet weak var SecondUsedChampionImage: UIImageView!
    @IBOutlet weak var ThirdUsedChampionImage: UIImageView!
    
    var UsedChampionsImages: Array<UIImageView>!
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        UsedChampionsImages = [
                FirstUsedChampionImage,
                SecondUsedChampionImage,
                ThirdUsedChampionImage
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScreen(segue: segue)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        interactor.fetchTopChampionsSummoner(request: MainModel.Fetch.Request(summonerName: "20361724", region: "euw", season: "7"))
    }
    
    func successFetchedItems(viewModel: MainModel.Fetch.ViewModel) {
        print(viewModel.topUsedChampions)
        for n in 1...3 {
            let url = URL(string: viewModel.topUsedChampions[n].thumbnailUrl!)
            let data = try? Data(contentsOf: url!)
            UsedChampionsImages[n].image = UIImage(data: data!)
        }
    }
    
    func errorFetchingItems(viewModel: MainModel.Fetch.ViewModel) {
        print(viewModel.message ?? "error fetching items")
    }
}
