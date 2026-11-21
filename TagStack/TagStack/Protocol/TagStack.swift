//
//  TagStack
//
//  Created by Yu Ming Yu on 11/18/26.
//

import SwiftUI

struct TagStack: Layout {
	//default value for spacing when placing subviews
	var spacing: CGFloat = 0

	func sizeThatFits(
		proposal: ProposedViewSize,
		subviews: Subviews,
		cache: inout ()
	) -> CGSize {
		let count = CGFloat(subviews.count)
		//loop thru subviews with map method to get array of subviews' CGSize
		let dimensions = subviews.map { $0.sizeThatFits(.unspecified) }
		// loop the sizes array to find each subviews' width and height value
		let widths = dimensions.map { $0.width }
		let heights = dimensions.map { $0.height }
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
		// find the widest subview's width
		let dimensions = subviews.map { $0.sizeThatFits(.unspecified) }
		let widths = dimensions.map { $0.width }
		let heights = dimensions.map { $0.height }
		guard let maxWidth = widths.max(), let maxHeight = heights.max() else {
			return
		}

		var origin = CGPoint(x: bounds.minX, y: bounds.midY)
		print(origin)

		/* Loop all subviews to:
			1. place each subview next to other in bound area;
			2. each width adjusted to the wildest width;
			3. align to the left with spacing in-between
		 */
		for subview in subviews {

			subview.place(
				at: origin,
				anchor: .leading,
				proposal: ProposedViewSize(width: maxWidth, height: 50)
			)
			origin.x += maxWidth + spacing

		}
	}
}
