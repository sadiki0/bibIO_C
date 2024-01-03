//
//  ContentView.swift
//  BibioC
//
//  Created by SADIKI on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var verseCount = 2;
    @State private var peopleCount = 1;
    @State private var readPerPerson = "";
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("BibIO_C")
                        .font(.system(size: 36))
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Text("\(readPerPerson)")
                        .font(.system(size:14))
                        .padding()
                    Spacer()
                }
                
                    
                Spacer()
                
                Text("A SADIKI UTILITY")
            }
            VStack {
                
                HStack(alignment: .center, spacing: -3.0){
                    Text("Verses")
                        .multilineTextAlignment(.trailing)
                        .padding(0)
                        .frame(width: 70, height: 20)
                    Picker("", selection: $verseCount) {
                        ForEach(2...176, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .padding(0)
                    .frame(width: 70, height: 20)
                }
                
                HStack(alignment: .center, spacing: -3.0){
                    Text("Readers")
                        .padding(0)
                        .frame(width: 70, height: 20)
                    Picker("", selection: $peopleCount) {
                        ForEach(1...30, id: \.self) { number in
                            Text("\(number)")
                        }
                    }
                    .padding(0)
                    .frame(width: 70, height: 10)
                }
                
                
                
                Button(/*@START_MENU_TOKEN@*/"Calculate"/*@END_MENU_TOKEN@*/, action: {
                    
                    // Add a verse to every cup until no other verses remain
                    var reading = Array(repeating: 0, count: peopleCount)
                    var i = 0
                    for _ in 1...verseCount {
                        reading[i] += 1
                        i = (i+1) % reading.count
                    }
                    
                    
                    // Formating
                    // I can think of many other ways of doing this, but too lazy to fix this.
                    i = 0
                    var currentNumber = reading[0]
                    var currentCount = 0
                    var currentDisplay = ""
                    
                    // Loop over every
                    while i < reading.count {
                        // Break if i goes over the verse count.
                        if i > verseCount {
                            break;
                        }
                        // If the current number no longer matches the cached one:
                        if reading[i] != currentNumber {
                            if currentCount != 0 && currentNumber != 0 {              currentDisplay += "\(currentCount) reads \(currentNumber)\n"
                            }
                            
                            // Do a little reset on some values and continue.
                            currentCount = 1
                            currentNumber = reading[i];
                            i+=1
                            continue;
                        }
                        
                        currentCount += 1
                        i+=1
                        
                    }
                    // Completely ignore this if one of these are impossible.
                    if currentCount != 0 && currentNumber != 0 {
                        currentDisplay += "\(currentCount) reads \(currentNumber)\n"
                    }
                    
                    readPerPerson = currentDisplay
                })
                .padding()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
