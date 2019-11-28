//
//  AlamofireWebService.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 05/09/2018.
//  Copyright © 2018 Marius Kurgonas. All rights reserved.
//

import Alamofire
import Foundation

class AlamofireService {
    init(context: ApiContextContract) {
        self.context = context
    }

    var context: ApiContextContract

    func post(at route: ApiRouteContract, params: Parameters? = [:]) -> DataRequest {
        return request(at: route,
                       method: .post,
                       params: params,
                       encoding: JSONEncoding.default)
    }

    private func request(at route: ApiRouteContract, method: HTTPMethod, params: Parameters?, encoding: ParameterEncoding) -> DataRequest {
        let url = route.url(for: context.environment)
        return Alamofire.request(url,
                                 method: method,
                                 parameters: params,
                                 encoding: encoding,
                                 headers: defaultHeaders())
    }

    private func defaultHeaders() -> [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
}
