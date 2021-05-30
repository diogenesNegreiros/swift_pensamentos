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
    
    let config = Configuration.shared
    var time: Timer = Timer()
    let quotesManager = QuotesManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    func formatView() {
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0)
        labelQuote.textColor = config.colorScheme == 0 ? .black : .white
        labelAuthor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        showRandomQuote()
    }
    
    func prepareQuote() {
        
        time.invalidate()
        
        if self.config.autoRefresh {
            Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (time) in
                self.showRandomQuote()
                self.time = time
            }
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
        lcTopConstraint.constant = 40
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.5) {
            self.labelQuote.alpha = 1
            self.labelAuthor.alpha = 1
            self.imageViewPhoto.alpha = 1
            self.imageViewPhotoBg.alpha = 0.25
            self.lcTopConstraint.constant = 10
            self.view.layoutIfNeeded()
        }
    }
    
}
