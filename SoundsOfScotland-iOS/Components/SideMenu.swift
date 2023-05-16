//
//  SideMenu.swift
//  Animated
//
//  Created by Brad on 05/09/2022.
//
import SwiftUI
import RiveRuntime

struct SideMenu: View {
    @State private var showingSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .padding(12)
                    .background(.white.opacity(0.8))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("Bradley Morrison")
                        .customFont(.body)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding()
            
            //Text("BROWSE")
                .customFont(.subheadline2)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            
            
            //Text("HISTORY")
                .customFont(.subheadline2)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            Text("CoreData")
                    .customFont(.subheadline2)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, 40)
                    .opacity(0.7)
                    .onTapGesture {
                    showingSheet.toggle()
                }
            
            
             
            
            
            Spacer()
            
            Spacer()
        }
        .foregroundColor(.black)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color("Background Light"))
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .frame(maxWidth: .infinity, alignment: .leading)
        .sheet(isPresented: $showingSheet) {
                    CoreDataDisplayView()
                }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
            .previewDevice("iPhone 13 Pro Max")
    }
}

