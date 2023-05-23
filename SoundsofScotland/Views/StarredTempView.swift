//
//  StarredTempView.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 18/05/2023.
//

import SwiftUI

struct StarredTempView: View {
    
    @EnvironmentObject var data : AppData
    @StateObject var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    @State private var buttonState = true
    
    var body: some View {
        VStack(spacing: 0) {
            // title
            Text("Starred")
                .customFont(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            
            // square cards
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.places) { place in
                    if (place.starred) {
                        ZStack {
                            // star button
                            HStack {
                                Spacer()
                                VStack {
                                    Button(action: {
                                        buttonState.toggle()
                                        viewModel.setStarred(state: false, place: place)
                                    }) {
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 50))
                                            .foregroundColor(buttonState ? .yellow : .black)
                                            .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 12)
                                    }
                                    Spacer()
                                }
                                
                            }
                            .zIndex(10)
                            
                            SquareCard(place: place)
                        }
                    }
                }
            }
            .padding(20)
            .onAppear(perform: {
            })
            
            Spacer()
        }
        .padding(.top, 80)
        .onAppear {
            data.mostRecentTab = .starred
        }
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
}


struct StarredTempView_Previews: PreviewProvider {
    static var previews: some View {
        StarredTempView()
            .environmentObject(AppData())
    }
}
