//
//  URLSession+NetworkingManagerContract.swift
//  LBPGoogleIO2017
//
//  Created by Leonardo Barros on 27/07/2017.
//  Copyright © 2017 Leonardo Barros. All rights reserved.
//

import Foundation

extension URLSession: NetworkingManagerContract {
    
    func getData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
}
