//
//  SwipeCardView.swift
//  Card
//
//  Created by iOS on 2021/1/26.
//

import SwiftUI

struct SwipeCardView: View {
    @State var offset = CGSize.zero
    let card: Card
    var removal: (() -> Void)? = nil
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .background(Color.red)
        }
        .frame(width: 250, height: 450)
        .rotationEffect(.degrees(Double(offset.width/250)))
        .offset(offset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }

                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        // 移除卡片
                        self.removal?()
                    } else {
                        self.offset = .zero
                    }

                        
                }
                
        )
        .animation(.spring())
    }
}

struct SwipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardView(card: Card(prompt: "", answer: ""))
    }
}
