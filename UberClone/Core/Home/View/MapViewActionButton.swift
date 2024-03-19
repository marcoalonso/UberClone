//
//  MapViewActionButton.swift
//  UberClone
//
//  Created by Marco Alonso on 27/02/24.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState : MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                actionForState(mapState)
            }
        }, label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("Debug: NoInput")
        case .locationSelected, .polylineAdded:
            mapState = .noInput
        case .searchingForLocation:
            mapState = .noInput
            viewModel.selectedUberLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .locationSelected, .searchingForLocation, .polylineAdded:
            return "arrow.left"
        }
    }
}

#Preview {
    MapViewActionButton(mapState: .constant(.noInput))
}
