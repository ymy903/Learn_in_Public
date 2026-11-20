//
//  ToastStackView.swift
//  ToastStack
//
//  Created by Yu Ming Yu on 10/30/26.
//

import SwiftUI

struct ToastStackView: View {
	@State private var isCollapsed: Bool = true
	
	let backingColors : [Color] = [.black.opacity(0.3), .black.opacity(0.5), .black]
	var peekSpacing: Double {isCollapsed ? 6 : 0}
	var toastLimit: Int { backingColors.count }
	
	
    var body: some View {
		//use Anylayout for switching between ZStack and Vstack
		let layout = isCollapsed
			? AnyLayout(ZStackLayout(alignment: .bottom))
			: AnyLayout(VStackLayout(alignment: .center, spacing: 8))
		//debug for tap
		let _ = print(isCollapsed)
			
		Color.blue
			.frame(width: 200, height: 100).border(.black)
			.frame(maxWidth: .infinity, alignment: .trailing).border(.red)
		
		layout {
			ForEach(0...toastLimit-1, id:\.self){ i in
				
				let depth: Double = Double((toastLimit-1)-i)
				let scale: Double = isCollapsed ? 1.0-0.025*depth : 1
				var animeDelay : TimeInterval = Double (i) * 0.6 
				
				ToastView(backingColor: backingColors[i])
					.scaleEffect(scale, anchor: .top)
					.offset(y:-depth * peekSpacing)
					.animation(.smooth.delay(animeDelay), value: isCollapsed)
//					.border(.blue)
			}
		}
		.padding(.bottom, 6)
		.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
		.border(.red)
		.onTapGesture {
			withAnimation(.smooth(duration: 0.5, extraBounce: 0.4)) {
				isCollapsed.toggle()
			}
		}
		
    }
}
	

#Preview {
    ToastStackView()
}

