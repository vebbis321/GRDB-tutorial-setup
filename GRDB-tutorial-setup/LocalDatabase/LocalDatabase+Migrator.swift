//
//  LocalDatabase+Migrator.swift
//  GRDB-tutorial-setup
//
//  Created by Vebjørn Daniloff on 9/8/23.
//

import Foundation
import GRDB

extension LocalDatabase {
    var migrator: DatabaseMigrator {
        var migrator = DatabaseMigrator()

        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif

        migrator.registerMigration("v1") { db in
            try createRestaurantAndDishTables(db)
        }

        return migrator

    }

    private func createRestaurantAndDishTables(_ db: GRDB.Database) throws {
        try db.create(table: "restaurant") { table in
            table.column("id", .text).primaryKey()
            table.column("name", .text).notNull()
        }

        try db.create(table: "dish") { table in
            table.autoIncrementedPrimaryKey("id")
            table.column("name", .text).notNull()
            table.belongsTo("restaurant", onDelete: .cascade)
                .notNull()
        }
    }
}
