//
//  dots.swift
//  UI-125
//
//  Created by にゃんにゃん丸 on 2021/02/13.
//

import SwiftUI

struct dots: View {
    var body: some View {
        ForEach(0...10,id:\.self){index in
            
            Circle().fill(Color.blue)
                .frame(width: 10, height: 10)
                .offset(x: -(rect.width / 2 + 32) / 2)
                .rotationEffect(.init(degrees: Double(index * 24)))
            
        }
        .rotationEffect(.init(degrees: -30))
    }
}

struct dots_Previews: PreviewProvider {
    static var previews: some View {
        dots()
    }
}
