//
//  WeightView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import SwiftUI
import Charts
import MapKit

struct WeightView: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "figure")

                Text("Weight")
                    .fontWeight(.semibold)
                    .font(.body)

                Spacer()

                Text("14 Oct")
                    .foregroundStyle(.gray)
                    .font(.caption)

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
                    .font(.caption)

            }.foregroundStyle(.purple)

            Spacer()

            HStack(alignment: .bottom){

                HStack(alignment: .bottom, spacing: 4){
                    Text("67")
                        .foregroundStyle(.primary)
                        .font(.system(size: 20, weight: .semibold))

                    Text("kg")
                        .foregroundStyle(.gray)
                        .font(.caption)
                }

                Spacer()


                }
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(Color("HealthCard"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 10)
        //RoundedRectangle(cornerRadius: 25)
        //    .fill(Color(white:0.12))
        //    .frame(height: 120)
        //    .padding(.horizontal, 12)

    }
}


#Preview {
    WeightView()
}
