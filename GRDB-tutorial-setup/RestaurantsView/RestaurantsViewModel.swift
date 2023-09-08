//
//  RestaurantsViewModel.swift
//  GRDB-tutorial-setup
//
//  Created by Vebjørn Daniloff on 9/7/23.
//

import Combine
class RestaurantsViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var isSheetShown = false

    init() {

        // bind

    }
}
