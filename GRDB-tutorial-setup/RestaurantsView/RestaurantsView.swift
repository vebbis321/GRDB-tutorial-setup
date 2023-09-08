//
//  ContentView.swift
//  GRDB-tutorial-setup
//
//  Created by Vebjørn Daniloff on 9/7/23.
//

import SwiftUI
import GRDB

struct RestaurantsView: View {


    @StateObject private var viewModel = RestaurantsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.restaurants, id: \.id) { restaurant in
                NavigationLink(restaurant.name) {
                    RestaurantDetailsView(restaurant: restaurant)
                }
            }
            .navigationTitle("Restaurants")
            .sheet(isPresented: $viewModel.isSheetShown, content: {
                AddRestaurantView()
            })
            .toolbar {
                Button("Add") {
                    viewModel.isSheetShown = true
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsView()
    }
}
