//
//  LoginServiceContract.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Foundation

typealias LoginServiceResult = (_ response: LoginResponseContract?, _ error: Error?) -> Void

protocol LoginServiceContract: CancelableServiceContract {
    func requestLogin(email: String, password: String, completion: @escaping LoginServiceResult)
}
