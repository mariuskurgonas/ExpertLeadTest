//
//  LoginResponseContract.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 16/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol LoginResponseContract {
    var token: String! { get }
    var message: String! { get }
}
