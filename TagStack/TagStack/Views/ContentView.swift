//
//  ContentView.swift
//  TagStack
//
//  Created by Yu Ming Yu on 11/18/26.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TagStack(spacing: 8) {
			TagView(tag: "#iOSdev")
			TagView(tag: "#b")
			//				.background(.red.opacity(0.2)) //debug
			TagView(tag: "#n")
			//				.background(.red.opacity(0.2)) //debug
			TagView(tag: "#sp")

		}
		.frame(maxWidth: .infinity, alignment: .leading)
//		.background(.green.opacity(0.2))  //debug

	}
}

#Preview {
	ContentView()
}
