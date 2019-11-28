//
//  LoginApiRoute.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

enum LoginApiRoute: ApiRouteContract { case
    
    login
    
    var path: String {
        switch self {
        case .login: return "authenticate"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
