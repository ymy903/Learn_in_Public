//
//  TagStack
//
//  Created by Yu Ming Yu on 11/18/26.
//

import SwiftUI

struct TagStack: Layout {
	//default value for spacing when placing subviews
	var spacing: CGFloat = 0
	//Refactored: make this helper func to measure the width and height of subviews
	private func maxSize(of subviews: Subviews)
		-> CGSize?
	{
		let sizes = subviews.map { $0.sizeThatFits(.unspecified) }  //array of subviews' size-want-to-be
		guard let maxWidth = sizes.map({ $0.width }).max(),  //array of widest width
			let maxHeight = sizes.map({ $0.height }).max()  //array of tallest height
		else { return nil }	//return "empty box"
		return CGSize(width: maxWidth, height: maxHeight)
	}

	func sizeThatFits(
		proposal: ProposedViewSize,
		subviews: Subviews,
		cache: inout ()
	) -> CGSize {
		let count = CGFloat(subviews.count)
		
		guard let size = maxSize(of: subviews) else { return .zero }	//check if func returns empty box
		let totalWidth = size.width * count + spacing * (count - 1)

		return CGSize(width: totalWidth, height: size.height)
	}

	func placeSubviews(
		in bounds: CGRect,
		proposal: ProposedViewSize,
		subviews: Subviews,
		cache: inout ()
	) {
		
		guard let size = maxSize(of: subviews) else { return }	//check if func returns empty box
		//placement point
		var origin = CGPoint(x: bounds.minX, y: bounds.midY)
		print(origin)

		/* Loop all subviews to:
			1. place each subview next to other in bound area;
			2. each width adjusted to the widest width;
			3. align to the left with spacing in-between
		 */
		for subview in subviews {

			subview.place(
				at: origin,
				anchor: .leading,
				proposal: ProposedViewSize(
					width: size.width,
					height: size.height
				)
			)
			origin.x += size.width + spacing

		}
	}
}
