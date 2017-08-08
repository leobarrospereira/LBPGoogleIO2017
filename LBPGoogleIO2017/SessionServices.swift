//
//  SessionServices.swift
//  LBPGoogleIO2017
//
//  Created by Leonardo Barros on 27/07/2017.
//  Copyright © 2017 Leonardo Barros. All rights reserved.
//

import Foundation

class SessionServices {
    
    let networkingManager: NetworkingManagerContract
    
    init(networkingManager: NetworkingManagerContract) {
        self.networkingManager = networkingManager
    }
}

extension SessionServices: SessionServicesContract {
    
    func fetchSessions(completion: @escaping (ServiceResult<[Session]>) -> Void) {
        let url = URL(string: "https://storage.googleapis.com/io2017-festivus/session_data_v1.100.json")
        
        networkingManager.getData(with: url!) { (data, urlResponse, error) in
            if let error = error {
                completion(ServiceResult.error(error))
                return
            }
            
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let sessionsArray = json?["sessions"] as? [[String: Any]] else {
                    let error = NSError(domain: "com.leonardobarros.LBPGoogleIO2017", code: -1,
                                        userInfo: [NSLocalizedDescriptionKey: "Wrong data"])
                    completion(ServiceResult.error(error))
                    return
            }
            
            let sessions = sessionsArray.flatMap { Session(dictionary: $0) }
            completion(ServiceResult.data(sessions))
        }
    }
}
