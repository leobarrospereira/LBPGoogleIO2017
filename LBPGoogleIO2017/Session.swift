//
//  Session.swift
//  LBPGoogleIO2017
//
//  Created by Leonardo Barros on 27/07/2017.
//  Copyright © 2017 Leonardo Barros. All rights reserved.
//

import Foundation

struct Session {
    
    let id: String
    let title: String
    let description: String
    let videoURL: URL
    let sessionURL: URL
    let tags: String
    let colorString: String
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String, let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String, let videoURLString = dictionary["youtubeUrl"] as? String,
            let videoURL = URL(string: videoURLString), let sessionURLString = dictionary["url"] as? String,
            let sessionURL = URL(string: sessionURLString), let tags = dictionary["tags"] as? [String],
            let colorString = dictionary["color"] as? String else {
                return nil
        }
        
        self.id = id
        self.title = title
        self.description = description
        self.videoURL = videoURL
        self.sessionURL = sessionURL
        self.colorString = colorString
        self.tags = tags.reduce("", { (result, item) -> String in
            if result.isEmpty {
                return item
            }
            return result + ", " + item
        })
    }
}
