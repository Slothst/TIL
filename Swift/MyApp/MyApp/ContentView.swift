//
//  ContentView.swift
//  MyApp
//
//  Created by 최낙주 on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    @State private var isOn = false
    @State private var image1: Image = Image(systemName: "sun.min.fill")
    @State private var image2: Image = Image(systemName: "sun.max.fill")
    @State private var selected: Bool = false
    @State private var flag: Bool = false

    var body: some View {
        List {
            Section {
                HStack {
                    Slider(value: $speed, in: 0...100) {
                        Text("hi")
                    } minimumValueLabel: {
                        image1
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                            .transaction {
                                $0.animation = $0.tapped ? .easeIn : .bouncy
                            } body: {
                                $0.scaleEffect(selected ? 2.0 : 1.0)
                            }
                            .onAppear(perform: {
                                if speed == 0 {
                                    withTransaction(\.tapped, true) {
                                        selected.toggle()
                                    }
                                }
                            })
                    } maximumValueLabel: {
                        image2
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                            .transaction {
                                $0.animation = $0.tapped ? .easeIn : .bouncy
                            } body: {
                                $0.scaleEffect(selected ? 3.0 : 1.0)
                            }
                            .onAppear(perform: {
                                if speed == 0 {
                                    withTransaction(\.tapped, true) {
                                        selected.toggle()
                                    }
                                }
                            })
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                }
                VStack {
                    Toggle(isOn: $isOn, label: {
                        Text("True Tone")
                    })
                }
            } header: {
                Text("밝기")
            } footer: {
                Text("iPhone 디스플레이를 주변광에 맞춰 자동으로 조정하여 색상이 다른 환경에서도 일관적으로 보이도록 합니다.")
            }
        }
    }
}

struct ImageKey: TransactionKey {
    static let defaultValue: Bool = false
}

extension Transaction {
    var tapped: Bool {
        get { self[ImageKey.self] }
        set { self[ImageKey.self] = newValue }
    }
    
    var tapped2: Bool {
        get { self[ImageKey.self] }
        set { self[ImageKey.self] = newValue }
    }
}

#Preview {
    ContentView()
}
