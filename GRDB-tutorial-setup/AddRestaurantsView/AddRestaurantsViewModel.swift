//
//  RestaurantsViewModel.swift
//  GRDB-tutorial-setup
//
//  Created by Vebjørn Daniloff on 9/7/23.
//

import Foundation
import Combine
final class AddRestaurantsViewModel: ObservableObject {
    @Published var restaurantName = ""
    @Published var dish_1 = ""
    @Published var dish_2 = ""



    func createRestaurant() async {
        guard !(restaurantName.isEmpty && dish_1.isEmpty && dish_2.isEmpty) else {
            return
        }

        do {
            // create rstaurants

        } catch {
            print(error)
        }
    }
}
