
import UIKit

protocol Coordinator {
	
	var rootViewController: UINavigationController { get }
	
	func start()
}
