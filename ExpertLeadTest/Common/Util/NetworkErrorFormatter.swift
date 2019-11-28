//
//  NetworkErrorFormatter.swift
//  ExpertLeadTest
//
//  Created by Marius Kurgonas on 28/11/2019.
//

import Foundation

class NetworkErrorFormatter {
    func errorFromServerMessage(from data: Data?, errorCode: Int) -> Error? {
        guard let d = data, let json = try? JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: String], let message = json?["message"] else {
            return nil
        }
        
        return NSError(domain: "", code: errorCode, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
