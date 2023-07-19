//
//  SwiftUIView.swift
//  
//
//  Created by Raul Quispe on 19/07/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Spacer().border(.red)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).border(PunaColor.Button.primary.getColor())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
