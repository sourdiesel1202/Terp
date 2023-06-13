import UIKit
import SwiftUI

class NavigationUtil: ObservableObject{
    @Published var navigationPath = NavigationPath()
    @Published var isNavigationStackActive: Bool
    @Published var allowFullScreenCovers: Bool
    init(){
        self.isNavigationStackActive=true
        self.allowFullScreenCovers=false
    }
    
}
//struct NavigationUtil {
//    static func popToRootView() {
//        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
//            .popToRootViewController(animated: true)
//    }
//static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
//        guard let viewController = viewController else {
//            return nil
//        }
//if let navigationController = viewController as? UINavigationController {
//            return navigationController
//        }
//for childViewController in viewController.children {
//            return findNavigationController(viewController: childViewController)
//        }
//return nil
//    }
//}
