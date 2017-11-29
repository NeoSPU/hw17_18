//
//  Hw18ViewController.swift
//  HW17
//
//  Created by Alex Neo on 26.11.2017.
//  Copyright © 2017 Alex Neo. All rights reserved.
//

import UIKit

class Hw18ViewController: UIViewController {
    
    @IBOutlet private weak var ibImageViewOne: UIImageView!
    @IBOutlet private weak var ibImageViewTwo: UIImageView!
    @IBOutlet private weak var ibImageViewThree: UIImageView!
    
    @IBOutlet private weak var ibActivityIndicatorOne: UIActivityIndicatorView!
    @IBOutlet private weak var ibActivityIndicatorTwo: UIActivityIndicatorView!
    @IBOutlet private weak var ibActivityIndicatorThree: UIActivityIndicatorView!
    
    private var targetArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    private var index = 0
    
    let targetScreenQueue = DispatchQueue.global()
    
    private let firstSetArray = [
        "http://static4.businessinsider.com/image/5833a5e4ba6eb637008b5ae2/the-story-of-how-steve-jobs-saved-apple-from-disaster-and-led-it-to-rule-the-world-in-39-photos.jpg",
        "https://fortunedotcom.files.wordpress.com/2016/09/ap_8404240445.jpg",
        "https://i2.wp.com/gizbrain.com/wp-content/uploads/2017/01/Steve-Jobs-iPhone.jpg?resize=1300%2C731",
        "http://img.wennermedia.com/article-leads-horizontal-1400/rs-183670-80823058.jpg",
        "http://archive.computerhistory.org/resources/still-image/apple_1/apple.steve_wozniak_and_steve_jobs_with_apple_I.1976.102665473.lg.jpg"
    ]
    
    private let secondSetArray = [
        "http://formula-success.ru/wp-content/uploads/2014/12/bill_gates_new2.jpg",
        "http://www.billgatesmicrosoft.com/billpaul.jpg",
        "https://cdn.geekwire.com/wp-content/uploads/2017/04/Bill-Gates-and-Paul-Allen-19811-300x207.jpg",
        "http://politikus.ru/uploads/posts/2014-07/1405935693_medium_cfb9610a1cb510abd23900a6d5324473.jpeg",
        "http://www.forex-review.com.ua/wp-content/uploads/2017/04/%D0%98%D1%81%D1%82%D0%BE%D1%80%D0%B8%D1%8F-%D1%83%D1%81%D0%BF%D0%B5%D1%85%D0%B0-%D0%91%D0%B8%D0%BB%D0%BB%D0%B0-%D0%93%D0%B5%D0%B9%D1%82%D1%81.jpg"
    ]
    
    private let thirdSetArray = [
        "https://cdn.lifehacker.ru/wp-content/uploads/2014/07/Steve-Jobs-vs-Bill-Gates-1985.jpg",
        "https://cdn.lifehacker.ru/wp-content/uploads/2014/07/%D0%A1%D1%82%D0%B8%D0%B2-%D0%94%D0%B6%D0%BE%D0%B1%D1%81-%D0%B8-%D0%91%D0%B8%D0%BB%D0%BB-%D0%93%D0%B5%D0%B9%D1%82%D1%81.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Steve_Jobs_and_Bill_Gates_%28522695099%29.jpg/800px-Steve_Jobs_and_Bill_Gates_%28522695099%29.jpg",
        "https://hi-news.ru/wp-content/uploads/2014/04/steve-jobs-and-bill-gates.jpg",
        "https://3dnews.ru/assets/external/illustrations/2015/10/28/922653/03.jpg"
    ]
    
    // MARK: - Private methods
    
    private func setupImageView() {
        ibImageViewOne.image = #imageLiteral(resourceName: "placeholder")
        ibImageViewTwo.image = #imageLiteral(resourceName: "placeholder")
        ibImageViewThree.image = #imageLiteral(resourceName: "placeholder")
    }
    
    private func downloadImage(targetArray: [String], nextIndex: Int) -> UIImage {
        guard index >= 0, index < targetArray.count else { return #imageLiteral(resourceName: "placeholder") }
        let imageStringUrl = targetArray[index]
        guard let url = URL(string: imageStringUrl) else { return #imageLiteral(resourceName: "placeholder") }
        guard let imageData = try? Data(contentsOf: url) else { return #imageLiteral(resourceName: "placeholder") }
        guard let loadedImage = UIImage(data: imageData) else { return #imageLiteral(resourceName: "placeholder") }
        return loadedImage
    }
    
    private func stopIndicator(activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
        }
    }
    
    private func startIndicator(activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.startAnimating()
        }
    }
    
    private func generateImageView(targetArray: [String], activityIndicator: UIActivityIndicatorView, imageView: UIImageView, nextIndex: Int) {
        startIndicator(activityIndicator: activityIndicator)
        targetScreenQueue.async {
            let oneImage = self.downloadImage(targetArray: targetArray, nextIndex: nextIndex)
            DispatchQueue.main.async {
                imageView.image = oneImage
            }
            self.stopIndicator(activityIndicator: activityIndicator)
        }
        self.index = (self.index + 1) % targetArray.count
    }
    
    @IBAction func ibRefreshButtonPressed(_ sender: Any) {
        generateImageView(targetArray: firstSetArray, activityIndicator: ibActivityIndicatorOne, imageView: ibImageViewOne, nextIndex: index)
        index -= 1
        generateImageView(targetArray: secondSetArray, activityIndicator: ibActivityIndicatorTwo, imageView: ibImageViewTwo, nextIndex: index)
        index -= 1
        generateImageView(targetArray: thirdSetArray, activityIndicator: ibActivityIndicatorThree, imageView: ibImageViewThree, nextIndex: index)
    }
}
