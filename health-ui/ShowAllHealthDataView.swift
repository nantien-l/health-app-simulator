//
//  ShowAllHealthDataView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import SwiftUI
import Charts
import MapKit

struct ShowAllHealthDataView: View {
    var body: some View {
        HStack{
            Image("healthicon")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)

            Text("Show All Health Data")
                .foregroundStyle(.primary)
                .font(.caption)
                .padding(3)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.caption)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(Color("HealthCard"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 10)



        //RoundedRectangle(cornerRadius: 1)
        //    .fill(Color.black)
        //    .frame(width: 360, height: 40)
        //    .cornerRadius(25)
    }
}


#Preview {
    ShowAllHealthDataView()
}
