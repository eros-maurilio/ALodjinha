import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)

        WindowFactory.make(with: window)
        
        window?.windowScene = windowScene
    }

    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {}

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {}

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {}

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {}

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {}

}

