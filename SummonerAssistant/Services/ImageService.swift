//
//  ImageService.swift
//  SummonerAssistant
//
//  Created by Asier Zapata on 09/06/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static func downloadImage(withURL url:URL, resolve: @escaping (_ image: UIImage?)->()) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, responseURL, error in
            var downloadedImage: UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            
            DispatchQueue.main.async {
                resolve(downloadedImage)
            }
        }
        
        dataTask.resume()
    }
    
    static func getImage(withURL url:URL, resolve: @escaping (_ image: UIImage?)->()) {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            resolve(image)
        } else {
            downloadImage(withURL: url, resolve: resolve)
        }
    }
}
