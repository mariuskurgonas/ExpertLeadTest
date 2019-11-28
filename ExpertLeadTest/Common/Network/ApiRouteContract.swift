//
//  ApiRouteContract.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 05/09/2018.
//  Copyright © 2018 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol ApiRouteContract {
    var path: String { get }

    func url(for environment: ApiEnvironment) -> String
}
