import UIKit

protocol RouterProtocol {
	
	func setRoot(_ viewController: UIViewController)
	func push(_ viewController: UIViewController, on coordinator: Coordinator)
	func present(_ viewController: UIViewController, to currentViewController: UIViewController, isAnimated: Bool)
}

internal final class Router {

	static let shared = Router()

    let window: UIWindow = {
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.windowLevel = UIWindow.Level.alert + 1
		return window
	}()
	
	private let navigationController: UINavigationController = UINavigationController()

	private init() {}

	func setRoot(_ viewController: UIViewController) {

		// Check whether keyWindow is not empty && window has root view contoller.
		// If true, update the root view contoller with animation.
		// If not, set as new root view controller
		
		let isKeyWindowEmpty = UIApplication.shared.keyWindow == nil
		
		if !isKeyWindowEmpty, window.rootViewController != nil {

			guard let snapshot = window.snapshotView(afterScreenUpdates: true) else {
				return
			}

			viewController.view.addSubview(snapshot)
			window.rootViewController = viewController

			UIView.animate(
				withDuration: 0.25,
				animations: {
					snapshot.layer.opacity = 0
					snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
				},
				completion: { (_) in
					snapshot.removeFromSuperview()
				}
			)
		} else {
			window.rootViewController = viewController
			window.makeKeyAndVisible()
		}
	}

	func push(_ viewController: UIViewController, on coordinator: Coordinator) {

		guard let nav = coordinator.rootViewController as? UINavigationController else {
			return
		}

		nav.pushViewController(viewController, animated: true)
	}
	
	func push(_ viewController: UIViewController, on coordinator: ChildCoordinator) {

		guard let nav = coordinator.rootViewController as? UINavigationController else {
			return
		}

		nav.pushViewController(viewController, animated: true)
	}
	
	func present(_ viewController: UIViewController, on coordinator: Coordinator) {

		let nav = coordinator.rootViewController
		
		viewController.modalPresentationStyle = .fullScreen
		nav.present(viewController, animated: true, completion: nil)
	}

	func present(_ viewController: UIViewController, to currentViewController: UIViewController, isAnimated: Bool = true) {

		currentViewController.present(viewController, animated: isAnimated, completion: nil)
	}
	
	 func dismissAllPresentedView(rootViewController: UIViewController, completion: (() -> Void)? = nil) {
		
		let presentingViewController = rootViewController.presentingViewController as? UINavigationController
		
		presentingViewController?.popToRootViewController(animated: true)
	}
}
