//
//  AddRestaurantView.swift
//  GRDB-Draft
//
//  Created by Vebjørn Daniloff on 9/7/23.
//

import SwiftUI



struct AddRestaurantView: View {
    @StateObject var viewModel = AddRestaurantsViewModel()
    var body: some View {
        VStack(spacing: 15) {

            Form {
                Section("Restaurant") {
                    TextField("Name", text: $viewModel.restaurantName)
                }

                Section("Dishes") {
                    TextField("Dish 1", text: $viewModel.dish_1)
                    TextField("Dish 2", text: $viewModel.dish_2)
                }
            }
            .frame(maxHeight: 300)
            .formStyle(.grouped)


            Button {
                Task {
                    await viewModel.createRestaurant()
                }
            } label: {
                HStack {
                    Spacer()
                    Text("Create")
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                    Spacer()
                }
                .background(Color.blue)
                .cornerRadius(8)
                .padding(.horizontal)
            }

            Spacer()
        }
    }
}


