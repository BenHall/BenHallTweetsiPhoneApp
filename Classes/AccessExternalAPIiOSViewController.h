//
//  AccessExternalAPIiOSViewController.h
//  AccessExternalAPIiOS
//
//  Created by Ben Hall on 11/01/11.
//  Copyright 2011 Ben Hall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccessExternalAPIiOSViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
   NSMutableArray *tweets;
   IBOutlet UITableView* _tweetList;
}
@property(nonatomic, retain) NSMutableArray *tweets;


@end

