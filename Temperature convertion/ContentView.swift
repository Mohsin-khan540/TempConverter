//
//  ContentView.swift
//  Temperature convertion
//
//  Created by Mohsin khan on 15/07/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var temp = ""
    @State private var fromUnit = "F°"
    @State private var toUnit = "C°"
    
    var changeType : Double?{
        Double(temp)
    }
  
    let temperatures = ["F°", "C°", "K°"]
    
    var results : Double{
        
         guard let  tempValue = changeType else {
            return 0
        }
        switch(fromUnit,toUnit){
        case("F°","C°"):
            return (tempValue - 32) * 5 / 9
            case ("F°","K°"):
            return ((tempValue - 32) * 5 / 9) + 273.15
        case ("C°","F°"):
            return tempValue * 9 / 5 + 32
        case ("C°","K°"):
            return tempValue + 273.15
        case ("K°","F°"):
            return (tempValue - 273.15) * 9 / 5 + 32
            case ("K°","C°"):
            return tempValue - 273.15
        default:
            return tempValue
        }
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    
                    Picker("From", selection: $fromUnit){
                        ForEach(temperatures , id :\.self){
                            Text($0)
                        }
                    }
                    Picker("To", selection: $toUnit){
                        ForEach(temperatures, id :\.self){
                            Text($0)
                        }
                    }
                }
                
                Section("Convert Temperature From \(fromUnit) To \(toUnit)"){
                    TextField("Enter temperature value" , text: $temp)
                        .keyboardType(.decimalPad)
                }
                Section("Converted temperature To \(toUnit)"){
                    if let tempValue = changeType , tempValue >= 0{
                        Text(results , format: .number)
                    }else{
                        Text("Enter valid temperature")
                            .foregroundColor(.gray)
                    }
                    
                }
                
            }
        
            .navigationTitle("Temperature convertion")
            .navigationBarTitleDisplayMode(.inline)
            
            Section{
                Button("Reset"){
                    temp = ""
                }
                .foregroundColor(.red)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
