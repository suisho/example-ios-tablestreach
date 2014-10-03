//
//  MyTableViewController.swift
//  TableStretch
//
//  Created by suisho on 2014/09/21.
//  Copyright (c) 2014年 suisho. All rights reserved.
//

import UIKit
class Documents{
    var body: [String] = []
    init(rep : Int){
        for i in 1...rep{
            body.append("あああああああああああああああああああああああああああ" + String(i))
        }
    }
}

class DocumentLabel : UILabel{
    func setImage(url : NSURL, complete :()-> Void){
        var placeholder = NSAttributedString(string:"loading")
        let progress { (a :Int, b: Int) -> in
            println("progress")
        }
        SDWebImageManager.sharedManager().downloadImageWithURL(<#url: NSURL!#>, options: <#SDWebImageOptions#>, progress: { (<#Int#>, <#Int#>) -> Void in
            <#code#>
        }, completed: <#SDWebImageCompletionWithFinishedBlock!##(UIImage!, NSError!, SDImageCacheType, Bool, NSURL!) -> Void#>)
        SDWebImageManager.sharedManager().downloadImageWithURL(url, options: SDWebImageOptions.RetryFailed, progress: nil) { (img :UIImage!, err:NSError!, cacheType: SDImageCacheType, finished:Bool, imageUrl:NSURL!) -> Void in
            // do
        }
    }
}
class MyTableViewController: UITableViewController {
    
    let doc = Documents(rep: 5)
    var docb : DocumentBuilder?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        docb = DocumentBuilder(strings: doc.body, font: UIFont.systemFontOfSize(17))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return doc.body.count + 1
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let h = docb!.size(300).height
        println(h)
        return h
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ruid_label_cell") as MyTableCell
        //cell.myTextView.attributedText = docb?.attributedStringc
        cell.myLabel.attributedText = docb?.attributedString
        cell.contentView.frame = CGRect(
            x: cell.myLabel.frame.origin.x,
            y: cell.myLabel.frame.origin.y,
            width: docb!.attributedString.size().width,
            height: docb!.attributedString.size().height)
        return cell
    }
    func foo(indexPath: NSIndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit

        if indexPath.row <  10 {
            cell.textLabel?.attributedText = docb?.attributedString
            //cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            //cell.textLabel?.text = doc.body[indexPath.row - 1]
        }else{
            let img = UIImage(named: "scratch.jpg")
            cell.imageView?.frame = CGRectMake(0, 0, 200, 200)
            cell.imageView?.bounds = CGRectMake(0, 0, 200, 200)
            cell.imageView?.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
            cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
            cell.imageView?.clipsToBounds = true
            cell.imageView?.image = img
            cell.imageView?.sd_setImageWithURL(NSURL(string:"http://suisho.github.io/scratch.jpg"))
            
        }
        //tableView.reloadData()
        
        return cell
    }
}

class MyTableCell : UITableViewCell{
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myTextView: UITextView!
}