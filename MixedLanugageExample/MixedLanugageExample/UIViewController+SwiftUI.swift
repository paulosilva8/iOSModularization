//
//  UIViewController+SwiftUI.swift
//  MixedLanugageExample
//
//  Created by Paulo Silva on 05/09/2022.
//  Copyright © 2022 GergelyOrosz. All rights reserved.
//

import UIKit
import SwiftUI

public extension UIViewController {
    private struct SwiftUIViewControllerWrapper: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Self.Context) -> UIViewController {
            viewController
        }
        
        func updateUIViewController(
            _ uiViewController: UIViewController,
            context: Self.Context
        ) {}
    }
    
    var asSwiftUIView: some View {
        SwiftUIViewControllerWrapper(viewController: self)
    }
}
