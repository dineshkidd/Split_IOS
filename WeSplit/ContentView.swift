//
//  ContentView.swift
//  WeSplit
//
//  Created by Dinesh C on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var check : Double = 0.0
    @State var people : Int = 0
    @State var tip : Int = 0
    @FocusState var isitFocused : Bool
    let tips = [0, 10, 25, 50, 75]
    
    var totalPerPerson : Double{
        return ((check/100*Double(tip))+check)/Double(people+2)
    }
    
    var total : Double{
        return ((check/100*Double(tip))+check)
    }
    var body: some View {
        NavigationStack{
                Form {
                    Section("Bill amount"){
                        TextField("Amount" , value: $check, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))
                            .keyboardType(.decimalPad).focused($isitFocused)
                        
                        Picker("Select no of people", selection: $people){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }
                    }
                    
//                    Section("Tip amount"){
//                        Picker("Tip", selection: $tip){
//                            ForEach(tips, id: \.self){
//                                Text("\($0)%")
//                            }
//                        }.pickerStyle(.segmented)
//                    }
                    
                    Section("Tip amount"){
                        Picker("Tip", selection: $tip){
                            ForEach(0...100, id: \.self){
                                Text("\($0)%")
                            }
                        }.pickerStyle(.navigationLink)
                    }
                    
                    Section("Amount per person"){
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))}
                    Section("Total with tip"){
                        Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "INR"))}
                    
                }.navigationTitle("Split")
                .toolbar{if isitFocused{
                    Button("Done"){
                        isitFocused = false}}}
                .pickerStyle(.navigationLink)
        }
    }
}

#Preview {
    ContentView()
}
