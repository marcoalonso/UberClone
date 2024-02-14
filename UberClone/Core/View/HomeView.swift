//
//  HomeView.swift
//  UberClone
//
//  Created by Marco Alonso on 14/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        UberMapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
