//
//  CatTracksViewController.swift
//  DiscoveringTipKit
//
//  Created by Vincent on 10/08/2023.
//

import TipKit
import UIKit

class ViewController: UIViewController {
    var favoriteLandmarkTip = FavoriteLandmarkTip()

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, world!"
        return label
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        Task { @MainActor in
            for await shouldDisplay in favoriteLandmarkTip.shouldDisplayUpdates {
                if shouldDisplay {
                    let tipPopoverViewController = TipUIPopoverViewController(
                        favoriteLandmarkTip,
                        sourceItem: label
                    )
                    present(tipPopoverViewController, animated: true)
                }
                else if presentedViewController is TipUIPopoverViewController {
                    dismiss(animated: true)
                }
            }
        }
    }
}
