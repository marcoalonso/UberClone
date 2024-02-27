//
//  MapViewActionButton.swift
//  UberClone
//
//  Created by Marco Alonso on 27/02/24.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var showLocationSearchView : Bool
    
    var body: some View {
        Button(action: {
            showLocationSearchView.toggle()
        }, label: {
            Image(systemName: "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MapViewActionButton(showLocationSearchView: .constant(true))
}
