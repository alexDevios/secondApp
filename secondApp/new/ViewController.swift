//
//  ViewController.swift
//  secondApp
//
//  Created by Alexandr Honcharenko on 30.06.2021.
//

import UIKit

public class ViewController123: UIViewController, Storyboardable {

    public override func viewDidLoad() {
        super.viewDidLoad()
    }


}

public class Temp {
    public func test() {
        print("test")
    }
}

protocol Storyboardable {

    static var defaultStoryboardName: String { get }
}

extension Storyboardable where Self: UIViewController {

    static var defaultStoryboardName: String {
        return String(describing: self)
    }

    static func storyboardViewController() -> Self {
        let storyboard = UIStoryboard(name: defaultStoryboardName, bundle: Bundle(for: Self.self))

        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(defaultStoryboardName)")
        }

        return viewController
    }
}

