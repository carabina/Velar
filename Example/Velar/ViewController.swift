//
//  ViewController.swift
//  Velar
//
//  Created by Jonathan Samudio on 04/27/2018.
//  Copyright (c) 2018 Jonathan Samudio. All rights reserved.
//

import UIKit
import Velar

class ViewController: UIViewController {

    private lazy var modalView: ModalViewPresenter = {
        return ModelViewBuilder.build(designer: DefaultBackgroundOverlayDesigner())
    }()

    private lazy var imagePopOverView: ImagePopOverView = {
        let view = ImagePopOverView.instanceFromNib()
        view.delegate = self
        return view
    }()

    @IBAction private func didTapButton(_ sender: Any) {
        modalView.showModal(view: imagePopOverView, animate: true)
    }

}

extension ViewController: ImagePopOverDelegate {

    func buttonSelected() {
        modalView.hideModal(animate: true)
    }

}
