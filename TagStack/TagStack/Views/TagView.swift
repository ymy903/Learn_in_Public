//
//  TagView.swift
//  TagStack
//
//  Created by Yu Ming Yu on 11/18/26.
//

import SwiftUI

struct TagView: View {

	var tag: String

	var body: some View {

		Text(tag)
			.padding(.horizontal, 12)
			.padding(.vertical, 6)
			.frame(minWidth: 50 , maxWidth: 100)
			.font(.body.weight(.semibold).width(.compressed))
			.foregroundStyle(.white)
			.background(.blue, in: Capsule())
			.lineLimit(1)
//			.background(.red.opacity(0.2)) //debug

	}
}

#Preview {
	VStack {
		TagView(tag: "#book")
		TagView(tag: "#iOS developer")
	}

}
