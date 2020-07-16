//
//  BlueScreenNode.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import AsyncDisplayKit

class BlueScreenNode: ASDisplayNode {
	
	private let viewModel: PINViewModel
	
	private let someText: ASTextNode
	
	init(viewModel: PINViewModel) {
		
		self.viewModel = viewModel
		
		self.someText = ASTextNode()
		super.init()
		
		automaticallyManagesSubnodes = true
		self.backgroundColor = .blue
		self.view.backgroundColor = .blue
		
		configureText()
	}
	
	override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
		
		let stack = ASStackLayoutSpec(
			direction: .vertical,
			spacing: 2,
			justifyContent: .center,
			alignItems: .center,
			children: [
				someText
			]
		)
		
		stack.style.width = ASDimensionMake(500)
		stack.style.height = ASDimensionMake(500)
		
		return stack
	}
	
	private func configureText() {
		
		someText.attributedText = NSAttributedString(string: "some text")
		someText.backgroundColor = .brown
	}
}
