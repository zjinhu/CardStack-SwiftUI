//
//  ContentView.swift
//  Card
//
//  Created by iOS on 2021/1/26.
//

import SwiftUI

struct Card : Hashable{
    let number: String
}

struct ContentView: View {

    @State private var cards = [Card]()
    
    var body: some View {

        VStack{
            CardStack(index: 1, data: cards) { date in
                
                GeometryReader { geo in
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        
                        Text("\(date.number)")
                    }
                    
                }
                .shadow(radius: 4)
                .padding(.all, 10.0)
                
                
            }.onAppear(perform: loadData)
            
            Button(action: {
                NotificationCenter.default.post(name: NSNotification.Name.init(CardNotification), object: 5)
            }, label: {
                Text("Button5")
            })
            
            Button(action: {
                NotificationCenter.default.post(name: NSNotification.Name.init(CardNotification), object: 2)
            }, label: {
                Text("Button2")
            })
        }
    }

    
    func loadData() {
        
        cards = [Card(number: "1"),
                 Card(number: "2"),
                 Card(number: "3"),
                 Card(number: "4"),
                 Card(number: "5"),
                 Card(number: "6"),
                 Card(number: "7"),
                 Card(number: "8"),
                 Card(number: "9"),
                 Card(number: "10"),
                 Card(number: "11"),
                 Card(number: "12"),
                 Card(number: "13"),
                 Card(number: "14"),
                 Card(number: "15"),
                 Card(number: "16"),
                 Card(number: "17"),
                 Card(number: "18"),
                 Card(number: "19"),
                 Card(number: "20")
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
