//
//  StepsView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import SwiftUI
import Charts
import MapKit

struct StepsView: View {
    var steps: String = "34"
    var date: String = "Yesterday"
    let barHeights: [CGFloat] = [42, 34, 45, 32, 17, 24, 19]

    var body: some View {
        VStack{
            HStack{
                Image(systemName: "flame.fill")

                Text("Steps")
                    .fontWeight(.semibold)
                    .font(.body)

                Spacer()

                Text(date)
                    .foregroundStyle(.gray)
                    .font(.caption)

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
                    .font(.caption)

            }.foregroundStyle(.orange)

            Spacer()

            HStack(alignment: .bottom){

                HStack(alignment: .bottom, spacing: 4){
                    Text(steps)
                        .foregroundStyle(.primary)
                        .font(.system(size: 20, weight: .semibold))

                    Text("Steps")
                        .foregroundStyle(.gray)
                        .font(.caption)
                }

                Spacer()

                HStack(alignment: .bottom, spacing: 4) {
                    ForEach(barHeights.indices, id: \.self) {index in
                        RoundedRectangle(cornerRadius: 2)
                            .fill(
                                index == 6
                                ? Color.orange
                                : Color.gray.opacity(0.4)
                            )
                            .frame(width: 7, height: barHeights[index])
                        }
                    }
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
    StepsView()
}
