//
//  ContentView.swift
//  BMI
//
//  Created by hiroyuki takahashi on R 7/11/02.
//

import SwiftUI

struct ContentView: View {
    @State private var Sintyou: Double = 0.0
    @State private var Taizyuu: Double = 0.0
    @State private var Tanni: String = "meter"
    let Tannis = ["meter","centimeter"]
    @FocusState private var isFocused: Bool
    var body: some View {
        NavigationStack {
            Form {
                Section("入力"){
                    HStack {
                        TextField("身長", value: $Sintyou, format: .number)
                            .keyboardType(.decimalPad)
                            .padding()
                            .focused($isFocused)


                        Picker("", selection: $Tanni) {
                            ForEach(Tannis, id: \.self) { Tanni in
                                Text(Tanni)
                            }
                        }
                        .pickerStyle(.menu)
                    }

                    HStack {

                        TextField("体重", value: $Taizyuu, format: .number)
                            .keyboardType(.decimalPad)
                            .padding()
                            .focused($isFocused)


                        Text("kg")
                    }

                }
                Section("結果"){
                    if Tanni == "centimeter" {
                        let bmi = Taizyuu / (Sintyou / 100) / (Sintyou / 100)
                        Text(bmi,format: .number)
                            .padding()
                    }

                    if Tanni == "meter" {
                        let bmi = Taizyuu / Sintyou / Sintyou
                        Text(bmi,format: .number)
                            .padding()
                    }
                }

                Button("キーボードを閉じる") {
                    isFocused = false
                }
            }
            .navigationTitle("BMI計算")
        }

    }
}

#Preview {
    ContentView()
}
