//
//  ToastView.swift
//  ToastStack
//
//  Created by Yu Ming Yu on 10/30/26.
//

import SwiftUI

struct ToastView: View {
	
	let backingColor: Color 
	
    var body: some View {
		HStack(alignment: .center, spacing: 16){
			//icon leading
			Image(systemName: "checkmark.circle")
				.resizable()
				.frame(width: 24, height: 24)
				.foregroundStyle(.green)
//				.border(.red)
			
			//text stack
			VStack(alignment: .leading, spacing: 0){
				Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
					.font(.title3.bold())
					.lineLimit(1)
					.foregroundStyle(.white)
				Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
					.font(.subheadline)
					.lineLimit(1)
					.foregroundStyle(.gray)
			}
			
			//icon trailing
			Image(systemName: "xmark")
				.resizable()
				.frame(width: 14, height: 14)
				.bold()
				.foregroundStyle(.gray)
//				.border(.red)
		}
		.padding(12)
		.frame(maxWidth: 320, minHeight: 70)
		.background(backingColor, in: RoundedRectangle(cornerRadius: 24))
//		.border(.red)
    }
}

#Preview {
	VStack(alignment: .leading, spacing: 8) {
		ToastView(backingColor: .black)
		ToastView(backingColor: .purple)
	}
	
}
