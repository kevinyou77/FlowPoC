//
//  PINViewController.swift
//  CoordinatorPOC
//
//  Created by Kevin Yulias on 15/07/20.
//  Copyright © 2020 Kevin Yulias. All rights reserved.
//

import AsyncDisplayKit

class PINViewModel {}
class PINViewController: ASViewController<ASDisplayNode> {
	
	private let mainNode: MainPINNode
	
	init(mainNode: MainPINNode) {
		
		self.mainNode = mainNode
		
		super.init(node: mainNode)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
