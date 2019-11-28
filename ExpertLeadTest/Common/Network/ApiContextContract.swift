//
//  ApiContextContract.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 05/09/2018.
//  Copyright © 2018 Marius Kurgonas. All rights reserved.
//

import Foundation

protocol ApiContextContract: AnyObject {
    var environment: ApiEnvironment { get set }
}
