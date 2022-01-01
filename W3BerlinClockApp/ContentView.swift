//
//  ContentView.swift
//  W3BerlinClockApp
//
//  Created by Arken Sarsenov on 14.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State var myTime = Date()
    @State var berlinClock: [String] = []
    @State var berlinClockString = ""
    
    var body: some View {
        ZStack {
            Color.myBGcolor.edgesIgnoringSafeArea(.all)
            VStack {
                Text("\(berlinClockString)").padding(20)
                ZStack{
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 358, height: 312)
                        .foregroundColor(.white
                        )
                    VStack {
                        if(berlinClock.count > 0){
                            HStack {
                                Circle().foregroundColor(
                                    berlinClock[0] == "Y" ? .yellowOnColor : .yellowOfColor).frame(width: 56, height: 56)
                            }
                            HStack {
                                //five hours
                                ForEach((1..<5)) {i in RoundedRectangle(cornerRadius: 4).frame(width: 74, height: 32).foregroundColor(berlinClock[i] == "R" ? .redOnColor : .redOffColor)}
                            }
                            HStack {
                                //one hours
                                ForEach((5..<9)) {i in RoundedRectangle(cornerRadius: 4).frame(width: 74, height: 32).foregroundColor(berlinClock[i] == "R" ? .redOnColor : .redOffColor)}
                            }
                            
                            HStack {
                                //five minutes
                                ForEach((9..<20)) {i in RoundedRectangle(cornerRadius: 2).fill(berlinClock[i] == "Y" ? Color.yellowOnColor : (berlinClock[i] == "R" ? Color.redOnColor : Color.redOffColor)).frame(width: 21, height: 32)
                                }
                            }
                            
                            HStack {
                                // one minute
                                ForEach((20..<24)) {i in RoundedRectangle(cornerRadius: 4).frame(width: 74, height: 32).foregroundColor(berlinClock[i] == "Y" ? .yellowOnColor : .yellowOfColor)}
                            }
                        }
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16).frame(width: 358, height: 54).foregroundColor(.white)
                    HStack(spacing: 180) {
                        Text("Insert time")
                        DatePicker("", selection: $myTime, displayedComponents: .hourAndMinute).environment(\.locale, Locale(identifier: "ru-Ru")).labelsHidden()
                    }
                }
                Spacer()
            }.padding(10)
                .onAppear {
                    dispayTime()
        }
    }
}


func dispayTime() {
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: myTime)
        let minutes = calendar.component(.minute, from: myTime)
        let hours = calendar.component(.hour, from: myTime)
        let data = BerkinClock()
        berlinClockString = "\(hours):\(minutes):\(seconds)"
        berlinClock = data.berlinClockData(hours, minutes, seconds).map{String($0)}
        print(berlinClock)
    }).fire()
}

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


