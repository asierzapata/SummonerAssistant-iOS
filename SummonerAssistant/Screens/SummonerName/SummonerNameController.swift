//
//  SummonerNameController.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation
import UIKit

class SummonerNameController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var router: SummonerNameRouter!
    
    var region: String = "euw"
    var pickerData: [String] = ["euw", "na", "kr"]
    
    @IBOutlet weak var summonerName: UITextField!
    @IBOutlet weak var regionPicker: UIPickerView!
    
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
        let router = SummonerNameRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        regionPicker.selectRow(2, inComponent: 0, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScreen(segue: segue)
    }
    
    @IBAction func send(_ sender: UIButton) {
        UserService.updateSummonerName(summoner: summonerName.text!, region: region)
        router.showLoader()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        region = pickerData[row]
    }
}
