//
//  ApiEnvironment.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 05/09/2018.
//  Copyright © 2018 Marius Kurgonas. All rights reserved.
//

import Foundation

enum ApiEnvironment: String { case

    development = "https://p0jtvgfrj3.execute-api.eu-central-1.amazonaws.com/test/"

    var url: String {
        return rawValue
    }
}
