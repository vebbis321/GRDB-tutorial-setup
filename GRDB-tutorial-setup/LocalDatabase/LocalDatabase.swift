//
//  LocalDatabase.swift
//  GRDB-tutorial-setup
//
//  Created by Vebjørn Daniloff on 9/8/23.
//

import Foundation
import GRDB

struct LocalDatabase {

    private let writer: DatabaseWriter

    init(_ writer: DatabaseWriter) throws {
        self.writer = writer
        try migrator.migrate(writer)
    }

    var reader: DatabaseReader {
        writer
    }
}
