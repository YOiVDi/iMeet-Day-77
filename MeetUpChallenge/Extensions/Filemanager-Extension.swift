//
//  Filemanager-Extension.swift
//  MeetUpChallenge
//
//  Created by Yordan Dimitrov on 16.04.24.
//

import Foundation

extension FileManager {
    var getDocumentDirectory: URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
