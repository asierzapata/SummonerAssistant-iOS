//
//  RoundedImageView.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 08/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    
    @IBInspectable var round: Bool = false {
        didSet {
            if(round){
                self.layer.cornerRadius = self.frame.size.width / 2;
                self.clipsToBounds = true;
            } else {
                self.layer.cornerRadius = 0;
                self.clipsToBounds = false;
            }
        }
    }
    
}
