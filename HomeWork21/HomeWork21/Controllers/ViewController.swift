//
//  ViewController.swift
//  HomeWork21
//
//  Created by Дарья Дубровская on 24.02.22.
//

import UIKit
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended
import Spring


class ViewController: UIViewController, NVActivityIndicatorViewable {
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var labelForce: UILabel!
    @IBOutlet weak var labelForceValue: UILabel!
    @IBOutlet weak var labelDuration: UILabel!
    @IBOutlet weak var labelDurationValue: UILabel!
    @IBOutlet weak var labelDelay: UILabel!
    @IBOutlet weak var labelDelayValue: UILabel!
    @IBOutlet weak var labelCurve: UILabel!
    @IBOutlet weak var labelCurveValue: UILabel!
    @IBOutlet weak var enterButton: UIButton!

    @IBOutlet weak var animationView: SpringView!
    var animationIndex = 0
    var curveIndex = 0

    private let presentingIndicatorTypes = {
        return NVActivityIndicatorType.ballSpinFadeLoader
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func enterButtonTouchUpInside(_ sender: UIButton) {
        if curveIndex == Curve.allCases.count {
            curveIndex = 0
        }
        if animationIndex == AnimationType.allCases.count {
            animationIndex = 0
        }
        animationView.backgroundColor = UIColor.random()
        animationView.animation = AnimationType.allCases[animationIndex].rawValue
        labelTitle.text = "\(AnimationType.allCases[animationIndex])"

        animationView.curve = Curve.allCases[curveIndex].rawValue
        labelCurveValue.text = "\(Curve.allCases[curveIndex].rawValue)"

        animationView.force = 2
        labelForceValue.text = "\(animationView.force)"

        animationView.duration = 1
        labelDurationValue.text = "\(animationView.duration)"

        animationView.delay = 1
        labelDelayValue.text = "\(animationView.delay)"


        animationView.animate()
        animationIndex += 1
        curveIndex += 1
    }

    private func setupUI() {
        animationView.layer.cornerRadius = animationView.frame.width / 2
        let size = CGSize(width: 30, height: 30)
        let indicatorType = presentingIndicatorTypes

        startAnimating(size, message: "Loading...", type: indicatorType, fadeInAnimation: nil)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Authenticating...")
        }

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating(nil)
        }
    }
}

