//
//  AppDelegate.swift
//  googleMap
//
//  Created by Ke4a on 03.12.2022.
//

import GoogleMaps
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.setMetalRendererEnabled(true)
        GMSServices.provideAPIKey("AIzaSyBhgT3hAs_nddjnk8Fubv9ZyH2l0DfK5ng")
        window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = ApplicationCoordinator(window: window)
        self.appCoordinator?.start()
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        showPrivacyProtectionView()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        hidePrivacyProtectionView()
    }

    private var privacyProtectionView: UIView?

    /// Adds blur to the root screen.
    private func showPrivacyProtectionView() {
        guard let frame = window?.rootViewController?.view.frame else { return }
        let view = PrivacyView(frame: frame)
        window?.rootViewController?.view.addSubview(view)
        privacyProtectionView = view
    }

    /// Removes blur from the root screen.
    private func hidePrivacyProtectionView() {
        privacyProtectionView?.removeFromSuperview()
        privacyProtectionView = nil
    }

}
