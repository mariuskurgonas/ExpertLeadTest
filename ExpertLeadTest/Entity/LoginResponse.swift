//
//  LoginResponse.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse: LoginResponseContract, Mappable {
    var token: String!
    
    var message: String!
    
    public required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        message <- map["message"]
    }
}
