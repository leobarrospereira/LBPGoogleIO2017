//
//  SessionServicesContract.swift
//  LBPGoogleIO2017
//
//  Created by Leonardo Barros on 27/07/2017.
//  Copyright © 2017 Leonardo Barros. All rights reserved.
//

import Foundation

enum ServiceResult<T> {
    case error(Error)
    case data(T)
}

protocol SessionServicesContract {
    
    func fetchSessions(completion: @escaping (ServiceResult<[Session]>) -> Void)
}
