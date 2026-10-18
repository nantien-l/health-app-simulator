//
//  HeadphoneAudioLevelsHighlightView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import MapKit

struct HeadphoneAudioLevelsHighlightView: View {

    let levels: [(CGFloat, CGFloat)] = [
        (10, 105), (80, 92), (30, 105),
        (25, 95), (30, 100), (50, 65), (15, 65)
    ]

    let days = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            // Header
            HStack {
                Image(systemName: "ear")

                Text("Headphone Audio Levels")
                    .fontWeight(.semibold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .foregroundStyle(.blue)

            // Summary
            Text("Your average headphone audio levels were OK over the last seven days.")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)

            Divider()

            // Chart
            ZStack(alignment: .leading) {

                // 灰色浮動長條圖
                HStack(alignment: .bottom, spacing: 10) {

                    Spacer(minLength: 130)

                    ForEach(levels.indices, id: \.self) { index in
                        VStack(spacing: 4) {
                            Capsule()
                                .fill(Color.gray.opacity(0.35))
                                .frame(width: 12, height: levels[index].1)
                                .offset(y: levels[index].0)

                            Spacer()


                            Text(days[index])
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }

                // Average information
                VStack(alignment: .leading, spacing: 4) {

                    Text("Average Level")
                        .foregroundStyle(.gray)
                        .font(.subheadline.bold())

                    // This gap leaves room for the blue average line.
                    Spacer().frame(height: 6)

                    HStack(spacing: 8) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                            .font(.system(size: 22, weight: .medium))

                        Text("OK")
                            .foregroundStyle(.primary)
                            .font(.system(size: 25, weight: .semibold))
                    }

                    Text("72 dB for 13 hr\n29 min")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13))

                }
                // Keep the title above the average line and the status below it.
                .offset(y: 23)

                // Average line crosses the vertical level ranges at mid-height.
                Rectangle()
                    .fill(.blue)
                    .frame(height: 4)
            }
            .frame(height: 190)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color("HealthHighlight"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 10)
    }
}


#Preview {
    HeadphoneAudioLevelsHighlightView()
}
