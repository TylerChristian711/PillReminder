//
//  OnboardingPageViewController.swift
//  Pill Reminder
//
//  Created by Chad Rutherford on 11/19/19.
//  Copyright © 2019 Chad & Tyler. All rights reserved.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {
    let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
    func getScreenOne() -> ScreenOne {
        return onboardingStoryboard.instantiateViewController(withIdentifier: "ScreenOne") as! ScreenOne
    }
    
    override func viewDidLoad() {
        setViewControllers([getScreenOne()], direction: .forward, animated: true)
        dataSource = self
        view.backgroundColor = .darkGray
    }
    
    func getScreenTwo() -> ScreenTwo {
        return onboardingStoryboard.instantiateViewController(withIdentifier: "ScreenTwo") as! ScreenTwo
    }
    
    func getScreenThree() -> ScreenThree {
        return onboardingStoryboard.instantiateViewController(withIdentifier: "ScreenThree") as! ScreenThree
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ScreenThree.self) {
            return getScreenTwo()
        } else if viewController.isKind(of: ScreenTwo.self) {
            return getScreenOne()
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: ScreenOne.self) {
            return getScreenTwo()
        } else if viewController.isKind(of: ScreenTwo.self) {
            return getScreenThree()
        } else {
            return nil
        }
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
