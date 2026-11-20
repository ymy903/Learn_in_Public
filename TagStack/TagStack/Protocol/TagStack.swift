//
//  TagStack
//
//  Created by Yu Ming Yu on 11/18/26.
//

import SwiftUI

struct TagStack: Layout {
	//default value for spacing when placing subviews
	var spacing: CGFloat = 4

	func sizeThatFits(
		proposal: ProposedViewSize,
		subviews: Subviews,
		cache: inout ()
	) -> CGSize {
		let count = CGFloat(subviews.count)
		//loop thru subviews with map method to get array of subviews' CGSize
		let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
		// loop the sizes array to find each subviews' width and height value
		let widths = sizes.map { $0.width }
		let heights = sizes.map { $0.height }
		//use max() to find out the max width and height
		guard let maxWidth = widths.max(), let maxHeight = heights.max() else {
			return .zero
		}
		//final proposed width
		let width = maxWidth * count + spacing * (count - 1)

		return CGSize(width: width, height: maxHeight)
	}

	func placeSubviews(
		in bounds: CGRect,
		proposal: ProposedViewSize,
		subviews: Subviews,
		cache: inout ()
	) {
		// width of each subview = (bounds.width - spacing * (subview.count - 1)) / subview.count
		 
	}
}
