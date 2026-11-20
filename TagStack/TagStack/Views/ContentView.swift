//
//  ContentView.swift
//  TagStack
//
//  Created by Yu Ming Yu on 11/18/26.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TagStack(spacing: 24) {
			TagView(tag: "#iOS developer sadasda")
			TagView(tag: "#book")

		}
		.padding()
	}
}

#Preview {
	ContentView()
}
