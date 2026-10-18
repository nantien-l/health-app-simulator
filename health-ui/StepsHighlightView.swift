//
//  StepsHighlightView.swift
//  health-ui
//
//  Created by Lai, Nan Tien on 2026/10/18.
//


import SwiftUI
import Playgrounds
import SwiftUI
import Charts
import MapKit

struct StepsHighlightView: View {

    // 模擬平均累積步數
    let average: [StepPoint] = [
        .init(hour: 0, steps: 0),
        .init(hour: 1, steps: 0),
        .init(hour: 2, steps: 1),
        .init(hour: 3, steps: 1),
        .init(hour: 4, steps: 1),
        .init(hour: 5, steps: 1),
        .init(hour: 6, steps: 1),
        .init(hour: 7, steps: 2),
        .init(hour: 8, steps: 3),
        .init(hour: 9, steps: 5),
        .init(hour: 10, steps: 10),
        .init(hour: 11, steps: 17),
        .init(hour: 12, steps: 25),
        .init(hour: 13, steps: 27),
        .init(hour: 14, steps: 29),
        .init(hour: 15, steps: 30),
        .init(hour: 16, steps: 43),
        .init(hour: 17, steps: 45),
        .init(hour: 18, steps: 68),
        .init(hour: 19, steps: 69),
        .init(hour: 20, steps: 76),
        .init(hour: 21, steps: 78),
        .init(hour: 22, steps: 83),
        .init(hour: 23, steps: 85),
        .init(hour: 24, steps: 93)
    ]

    // 模擬今日累積步數
    let today: [StepPoint] = [
        .init(hour: 0, steps: 0),
        .init(hour: 1, steps: 0),
        .init(hour: 2, steps: 0),
        .init(hour: 3, steps: 0)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            // 標題
            HStack {
                Image(systemName: "flame.fill")

                Text("Steps")
                    .fontWeight(.semibold)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .foregroundStyle(.orange)

            // 摘要
            Text("You're walking less than you usually do by this point.")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)

            Divider()

            // Today / Average
            HStack(alignment: .top) {

                VStack(alignment: .leading, spacing: 6) {
                    Label("Today", systemImage: "circle.fill")
                        .font(.subheadline)
                        .foregroundStyle(.orange)

                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("34")
                            .font(.system(size: 28, weight: .semibold))

                        Text("steps")
                            .font(.subheadline)
                    }
                    .foregroundStyle(.orange)
                }

                Spacer()

                VStack(alignment: .leading, spacing: 6) {
                    Label("Average", systemImage: "circle.fill")
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("20,497")
                            .font(.system(size: 28, weight: .semibold))

                        Text("steps")
                            .font(.subheadline)
                    }
                    .foregroundStyle(.gray)
                }

                Spacer()
            }

            // 折線圖
            Chart {
                ForEach(average) { point in
                    LineMark(
                        x: .value("Hour", point.hour),
                        y: .value("Steps", point.steps),
                        series: .value("Series", "Average")
                    )
                    .foregroundStyle(Color.gray.opacity(0.35))
                    .interpolationMethod(.linear)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                }

                ForEach(today) { point in
                    LineMark(
                        x: .value("Hour", point.hour),
                        y: .value("Steps", point.steps),
                        series: .value("Series", "Today")
                    )
                    .foregroundStyle(.orange)
                    .lineStyle(StrokeStyle(lineWidth: 4))
                }

                RuleMark(x: .value("Current Time", 3))
                    .foregroundStyle(.gray.opacity(0.5))

                PointMark(
                    x: .value("Hour", 3),
                    y: .value("Steps", 1)
                )
                .foregroundStyle(.orange)
                .symbolSize(100)

            }
            .chartXScale(domain: 0...24)
            .chartYScale(domain: 0...80)
            .chartYAxis(.hidden)
            .chartXAxis {
                AxisMarks(values: Array(0...24)) { value in
                    if let hour = value.as(Int.self) {
                        AxisValueLabel(".")
                    }
                }
            }

            .frame(height: 150)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color("HealthHighlight"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 10)
    }
}


#Preview {
    StepsHighlightView()
}
