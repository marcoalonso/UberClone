//
//  RideRequestView.swift
//  UberClone
//
//  Created by Marco Alonso on 05/03/24.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
//            trip info view
            HStack {
//                indicator view
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 32)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                    
                }
                
                VStack(alignment: .leading, spacing: 24.0) {
                    HStack {
                        Text("Current location")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.bottom, 10)
                        
                        Spacer()
                        
                        Text("1:30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.bottom, 10)
                    }
                    .foregroundColor(.gray)
                    
                    
                    HStack {
                        Text("Starbuck coffee")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.bottom, 10)
                        
                        Spacer()
                        
                        Text("1:30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.bottom, 10)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
//            ride type selection View
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12.0) {
                    ForEach(0 ..< 4, id: \.self) { _ in
                        VStack {
                            Image("uber-x")
                                .resizable()
                                .scaledToFit()
                            
                            VStack(spacing: 4.0) {
                                Text("UberX")
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Text("145.56")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(8)
                        }
                        .frame(width: 112, height: 140)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(12)
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)

            //            payment option view
            HStack(spacing: 12.0) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
//            request ride button
            Button(action: {
                
            }, label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(12)
                    .foregroundColor(.white)
            })
        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(24)
    }
}

#Preview {
    RideRequestView()
}
