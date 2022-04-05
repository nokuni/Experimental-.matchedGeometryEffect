//
//  ContentView.swift
//  ExperimentingProject
//
//  Created by Maertens Yann-Christophe on 14/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var user = User.maria
    @State var image = ProfileImage()
    @State var minimumSize: CGFloat = UIScreen.main.bounds.width * 0.25
    @State var hasChanged = false
    var body: some View {
        VStack {
            InfoView(user: user, size: image.size, isChanged: $hasChanged)
                .animation(.spring(), value: hasChanged)
            
            UserContentScrollView(user: user, updateScroll: updateScroll)
        }
    }
    func updateScroll(scrollValue: CGFloat) {
        let maxSize: CGFloat = UIScreen.main.bounds.width * 0.4
        let isZeroOrLess = scrollValue <= 0.0
        let updatedSize = maxSize - scrollValue
        
        if !isZeroOrLess {
            if !hasChanged {
                image.size = updatedSize
                print("size:\(image.size)")
                print("minimumSize:\(minimumSize)")
                if image.size == minimumSize {
                    animateInfos(scrollValue)
                }
            }
            
            if hasChanged {
                image.size = updatedSize
                print("size1:\(image.size)")
                if image.size > minimumSize {
                    animateInfos(scrollValue)
                }
            }
        }
    }
    
    func animateInfos(_ scrollValue: CGFloat) {
        hasChanged.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ProfileImage {
    @FiniteSize var size
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
