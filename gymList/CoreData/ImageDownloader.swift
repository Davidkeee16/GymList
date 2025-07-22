//
//  ImageDownloader.swift
//  gymList
//
//  Created by David Puksanskis on 16/07/2025.
//

import Foundation


func downloadImageAsync(from urlString: String, completion: @escaping (Data?) -> Void) {
    
    guard let url = URL(string: urlString) else {
        print("Invalid URL:", urlString)
        completion(nil)
        return
    }
    URLSession.shared.dataTask(with: url) { data, response, error in
        if error != nil {
            print("Error of download images with error \(url)")
        }
        completion(data)
    }.resume()
    
}
