//
//  LoginAlamofireService.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 15/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import Foundation

class LoginAlamofireService: AlamofireService, LoginServiceContract {
    var networkErrorFormatter: NetworkErrorFormatter?
    
    func requestLogin(email: String, password: String, completion: @escaping LoginServiceResult) {
        let params: Parameters = ["email" : email, "password" : password]
        request = post(at: LoginApiRoute.login, params: params)
            .validate(statusCode: 200..<300)
            .responseObject(completionHandler: {[weak self] (response: DataResponse<LoginResponse>) in
                
                var formattedError = response.error
                if let error = response.error as NSError?, let serverMessageError = self?.networkErrorFormatter?.errorFromServerMessage(from: response.data, errorCode: response.response?.statusCode ?? 0) {
                    formattedError = serverMessageError
                }
                
                DispatchQueue.main.async {
                    completion(response.value, formattedError)
                }
            })
    }
    
    func cancel() {
        request?.cancel()
    }
    
    var request: Request?
}
