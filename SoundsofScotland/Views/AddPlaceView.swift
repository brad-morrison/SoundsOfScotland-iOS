//
//  AddPlaceView.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 16/05/2023.
//

import SwiftUI
import CoreData

struct AddPlaceView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = ViewModel(context: PersistenceController.shared.container.viewContext)
    
    @State private var name = ""
    @State private var path = ""
    @State private var image = ""
    
    var body: some View {
        NavigationView {
            Form {
                Text("Name")
                    .customFont(.body)
                TextField("enter here", text: $name)
                Text("Image")
                    .customFont(.body)
                TextField("enter here", text: $image)
            
                Text("Path")
                    .customFont(.body)
                TextField("enter here", text: $path)
                    
                    
                Button("Save") {
                    viewModel.addPlace(name: name, image: "0", path: "", starred: false)
                    viewModel.fetchPlaces()
                    dismiss()
                }
                
            }.navigationTitle("Add Place")
        }
    }
        
        
    }


struct AddPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlaceView()
    }
}
