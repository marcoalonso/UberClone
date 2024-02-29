//
//  LocationSearchResultCell.swift
//  UberClone
//
//  Created by Marco Alonso on 27/02/24.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 4.0) {
                Text(title)
                    .font(.body)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
                
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell(title: "Cinepolis", subtitle: "Av. Americas 1234 Morelia, Mich.")
}
