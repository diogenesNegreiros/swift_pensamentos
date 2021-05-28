//
//  QuotesViewController.swift
//  Swift_Pensamentos
//
//  Created by Diogenes de Souza on 27/05/21.
//
import UIKit

class QuotesViewController: UIViewController {
    @IBOutlet weak var lcTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var imageViewPhotoBg: UIImageView!
    @IBOutlet weak var labelQuote: UILabel!
    @IBOutlet weak var labelAuthor: UILabel!
    
    let quotesManager = QuotesManager()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareQuote()
    }
    
    func prepareQuote() {
        timer?.invalidate()
        Timer.scheduledTimer(withTimeInterval: 8.0, repeats: true) { (timer) in
            self.showRandomQuote()
        }
        showRandomQuote()
    }
    
    func showRandomQuote() {
        let quote = quotesManager.getRandomQuote()
        labelQuote.text = quote.quote
        labelAuthor.text = quote.author
        imageViewPhoto.image = UIImage(named: quote.image)
        
        labelQuote.alpha = 0
        labelAuthor.alpha = 0
        imageViewPhoto.alpha = 0
        imageViewPhotoBg.alpha = 0
        
        UIView.animate(withDuration: 2.5) {
            self.labelQuote.alpha = 1
            self.labelAuthor.alpha = 1
            self.imageViewPhoto.alpha = 1
            self.imageViewPhotoBg.alpha = 0.25
        }
    }
    
}
