//
//  ContentView.swift
//  chapter31.5
//
//  Created by HEE TAE YANG on 2020/06/08.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var offset: CGSize = .zero
    @State private var dragEnalbled: Bool = false
//    @GestureState private var offset: CGSize = .zero
//    @GestureState private var longPress: Bool = false
    
    var body: some View {
        
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 2.0)
            .onEnded( {_ in
                self.dragEnalbled = true
            })
        .sequenced(before: DragGesture())
            .updating($offset) { v, state, tran  in
                
                switch v {
                    
                case .first(true):
                    print("Long press in progress")
                    
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                    print("AA")
                    
                default: break
                }
            }
            .onEnded { value in
                self.dragEnalbled = false
            }
        
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnalbled ? Color.green : Color.blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressBeforeDrag)
    }
}
        
        
//        let longPressAndDrag = LongPressGesture(minimumDuration: 1.0)
//            .updating($longPress) { value, state, transition in
//                state = value
//            }
//            .simultaneously(with: DragGesture())
//            .updating($offset) { value, state, transaction in
//                state = value.second?.translation ?? .zero
//        }
//
//        return Image(systemName: "hand.point.right.fill")
//            .foregroundColor(longPress ? Color.red : Color.blue)
//            .font(.largeTitle)
//            .offset(offset)
//            .gesture(longPressAndDrag)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
