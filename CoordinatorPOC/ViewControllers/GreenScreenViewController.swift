import AsyncDisplayKit

class GreenScreenViewController: ASViewController<ASDisplayNode> {
	
	init(node: GreenScreenNode) {

		super.init(node: node)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
